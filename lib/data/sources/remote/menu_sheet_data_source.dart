import 'dart:async';

import 'package:csv/csv.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract interface class IMenuSheetDataSource {
  Future<void> load();
  String? imageUrlFor(String skuNo);
  /// Looks up [languageId]'s (e.g. "PB.PN.0001") translated text for [lang]
  /// ("en"/"ja"/"ko"/"zh", case-insensitive) — falls back to English if
  /// [lang] isn't a recognized column, then null if the row itself doesn't
  /// exist (sheet not loaded yet, or the id was renamed/removed).
  String? translate(String languageId, String lang);
}

/// Fetches the same Google Sheet kds reads, via its "Version Info" tab
/// indirection (a changed publish-gid on a real data tab doesn't break
/// this) — "Menu List" (thumbnail images, keyed by SKUNo) and "Language
/// List" (UI text translations, keyed by Language ID, e.g. "PB.PN.0001").
///
/// Re-checks Version Info every [_refreshInterval] and only re-fetches
/// whichever tracked tab's last-updated timestamp actually changed —
/// mirroring kds's own MenuSheetDataSource.
@Singleton(as: IMenuSheetDataSource)
class MenuSheetDataSource implements IMenuSheetDataSource {
  static const _versionInfoCsvUrl =
      'https://docs.google.com/spreadsheets/d/e/2PACX-1vRjetA91xB8_tsu6wDnq8hRIi-0Par49dRi1fAy4LUliGtH0L9lADbfRAZrOqouUPjZmIQLcVNpvNY1/pub?gid=844462145&single=true&output=csv';

  static const _menuListSheetName = 'Menu List';
  static const _languageListSheetName = 'Language List';
  static const _trackedSheets = {_menuListSheetName, _languageListSheetName};

  // Column NAMES — looked up by header rather than fixed position (see
  // _headerIndex/_cell) so a column inserted/reordered in the sheet (this
  // has already happened twice on Menu List — see kds's own
  // MenuSheetDataSource) can never silently misalign this reader too.
  static const _colSkuNo = 'SKUNo';
  static const _colThumbnailImage = 'Thumbnail.Image';
  static const _colLanguageId = 'Language ID';
  static const _colLanguageEN = 'Language.EN';
  static const _colLanguageJA = 'Language.JA';
  static const _colLanguageKO = 'Language.KO';
  static const _colLanguageZH = 'Language.ZH';

  static const _refreshInterval = Duration(minutes: 2);

  final Dio _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      followRedirects: true,
      maxRedirects: 5,
    ),
  );

  final Map<String, String> _imagesBySkuNo = {};
  final Map<String, Map<String, String>> _translations = {};
  final Map<String, String> _lastUpdated = {};
  Timer? _refreshTimer;

  @override
  String? imageUrlFor(String skuNo) => _imagesBySkuNo[skuNo];

  @override
  String? translate(String languageId, String lang) {
    final row = _translations[languageId];
    if (row == null) return null;
    final text = row[lang.trim().toLowerCase()] ?? row['en'];
    // Sheet authors write '<br>' where a translation needs an explicit line
    // break (plain text is far more foolproof to type into a cell than an
    // actual embedded newline, which needs Alt+Enter and would turn that
    // cell into a multi-line CSV field) — converted to a real newline here,
    // once, so every caller (pickup notice, bottom bar) gets it for free.
    return text?.replaceAll('<br>', '\n');
  }

  @override
  Future<void> load() async {
    await _checkAndReload(force: true);
    _refreshTimer?.cancel();
    _refreshTimer = Timer.periodic(_refreshInterval, (_) => unawaited(_checkAndReload()));
  }

  /// Fetches Version Info and re-loads only whichever tracked sheet's
  /// timestamp changed since the last successful load — or every tracked
  /// sheet if [force] (the very first [load]).
  Future<void> _checkAndReload({bool force = false}) async {
    try {
      final meta = await _fetchSheetMeta();
      final changed = force
          ? _trackedSheets
          : meta.entries
              .where((e) => _trackedSheets.contains(e.key) && _lastUpdated[e.key] != e.value.lastUpdated)
              .map((e) => e.key)
              .toSet();
      if (changed.isEmpty) return;

      if (changed.contains(_menuListSheetName)) {
        final url = meta[_menuListSheetName]?.csvUrl;
        if (url != null) {
          final rows = await _fetchCsv(url);
          final headers = _headerIndex(rows);
          final images = <String, String>{};
          for (final row in rows.skip(1)) {
            final skuNo = _cell(row, headers, _colSkuNo);
            if (skuNo.isEmpty) continue;
            final imageUrl = _resolveDriveImageUrl(_cell(row, headers, _colThumbnailImage));
            if (imageUrl != null) images[skuNo] = imageUrl;
          }
          _imagesBySkuNo
            ..clear()
            ..addAll(images);
        }
      }

      if (changed.contains(_languageListSheetName)) {
        final url = meta[_languageListSheetName]?.csvUrl;
        if (url != null) {
          final rows = await _fetchCsv(url);
          final headers = _headerIndex(rows);
          final translations = <String, Map<String, String>>{};
          for (final row in rows.skip(1)) {
            final languageId = _cell(row, headers, _colLanguageId);
            if (languageId.isEmpty) continue;
            translations[languageId] = {
              'en': _cell(row, headers, _colLanguageEN),
              'ja': _cell(row, headers, _colLanguageJA),
              'ko': _cell(row, headers, _colLanguageKO),
              'zh': _cell(row, headers, _colLanguageZH),
            };
          }
          _translations
            ..clear()
            ..addAll(translations);
        }
      }

      for (final entry in meta.entries) {
        if (_trackedSheets.contains(entry.key)) {
          _lastUpdated[entry.key] = entry.value.lastUpdated;
        }
      }
    } catch (_) {
      // Sheet unreachable — existing cached data (images/translations) just
      // stays as whatever it already was until the next check succeeds.
    }
  }

  Future<Map<String, ({String lastUpdated, String csvUrl})>> _fetchSheetMeta() async {
    final rows = await _fetchCsv(_versionInfoCsvUrl);
    final headers = _headerIndex(rows);
    final result = <String, ({String lastUpdated, String csvUrl})>{};
    for (final row in rows.skip(1)) {
      final name = _cell(row, headers, 'Sheets');
      if (name.isEmpty) continue;
      result[name] = (
        lastUpdated: _cell(row, headers, 'Last Updated (Sheet)'),
        csvUrl: _cell(row, headers, 'CSV File URL'),
      );
    }
    return result;
  }

  /// Maps each header cell (row 0) to its column position, so every parser
  /// above looks values up by name instead of a fixed index — a column
  /// inserted/reordered in the sheet just shifts positions in this map,
  /// never silently misaligns a hardcoded number again.
  Map<String, int> _headerIndex(List<List<dynamic>> rows) {
    if (rows.isEmpty) return const {};
    final header = rows.first;
    final map = <String, int>{};
    for (var i = 0; i < header.length; i++) {
      final name = header[i].toString().trim();
      if (name.isNotEmpty) map[name] = i;
    }
    return map;
  }

  /// [row]'s value under column [name], or '' if that column doesn't exist
  /// in this sheet (unknown header) or this particular row is short one.
  String _cell(List<dynamic> row, Map<String, int> headers, String name) {
    final idx = headers[name];
    if (idx == null || idx >= row.length) return '';
    return row[idx].toString().trim();
  }

  Future<List<List<dynamic>>> _fetchCsv(String url) async {
    final response = await _dio.get<String>(
      url,
      options: Options(responseType: ResponseType.plain),
    );
    final body = (response.data ?? '').replaceAll('\r\n', '\n').replaceAll('\r', '\n');
    return const CsvToListConverter(
      fieldDelimiter: ',',
      eol: '\n',
      shouldParseNumbers: false,
    ).convert(body);
  }

  /// Rewrites a Google Drive "share" link into a directly-loadable image
  /// URL — Image.network can't render the share-link's HTML page itself.
  String? _resolveDriveImageUrl(String rawUrl) {
    if (rawUrl.isEmpty) return null;
    final match = RegExp(r'/d/([a-zA-Z0-9_-]+)').firstMatch(rawUrl);
    final id = match?.group(1);
    if (id == null) return null;
    return 'https://lh3.googleusercontent.com/d/$id=s200';
  }
}
