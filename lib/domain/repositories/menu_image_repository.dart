/// Resolves reference data from the same Google Sheet kds reads: a SKU
/// number (as sent by FlowHub alongside order/machine status) to a menu
/// thumbnail image URL ("Menu List" tab, keyed by SKUNo instead of menu
/// name), and a Language ID (e.g. "PB.PN.0001") to its translated UI text
/// ("Language List" tab).
abstract interface class MenuImageRepository {
  /// Fetches/refreshes the sheets. Safe to call once at startup and left
  /// unawaited — [imageUrlFor]/[translate] just return null until the first
  /// load completes.
  Future<void> load();

  /// The thumbnail image URL for [skuNo], or null if the sheet hasn't
  /// loaded yet or has no matching row.
  String? imageUrlFor(String skuNo);

  /// The translated text for [languageId] in [lang], or null if the sheet
  /// hasn't loaded yet or has no matching row — see
  /// IMenuSheetDataSource.translate.
  String? translate(String languageId, String lang);
}
