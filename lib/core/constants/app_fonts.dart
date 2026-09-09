/// Customer-facing translated text (pickup notice, status bar message) needs
/// the font that actually covers that language's script — a single font
/// can't do Latin/Hangul/Kana/Hanzi all well. Falls back to the English cut
/// for any unrecognized/empty language code. See pubspec.yaml's `fonts:`
/// section for what each family name is registered to.
class AppFonts {
  const AppFonts._();

  static String fontFamilyForLanguage(String lang) => switch (lang.trim().toLowerCase()) {
    'ko' => 'LineSeedKR',
    'ja' => 'LineSeedJP',
    'zh' => 'MiSans',
    _ => 'LineSeedEN',
  };
}
