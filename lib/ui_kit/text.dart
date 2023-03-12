part of app_theme;

const _appFontFamily = 'Open Sans';

abstract class AppTextTheme {
  static TextTheme appTextTheme() {
    return const TextTheme(
      displayLarge: displayLarge,
      headlineLarge: headlineLarge,
      titleLarge: titleLarge,
      bodyLarge: bodyLarge,
      labelLarge: labelLarge,
    );
  }

  static const displayLarge = TextStyle(
    fontSize: 24.0,
    color: AppColorsScheme.black,
    fontFamily: _appFontFamily,
  );
  static const headlineLarge = TextStyle(
    fontSize: 16.0,
    color: AppColorsScheme.black,
    fontFamily: _appFontFamily,
  );
  static const titleLarge = TextStyle(
    fontSize: 14.0,
    color: AppColorsScheme.black,
    fontFamily: _appFontFamily,
  );
  static const bodyLarge = TextStyle(
    fontSize: 12.0,
    color: AppColorsScheme.black,
    fontFamily: _appFontFamily,
  );
  static const labelLarge = TextStyle(
    fontSize: 8.0,
    color: AppColorsScheme.black,
    fontFamily: _appFontFamily,
  );
}

extension TextThemeBold on TextStyle {
  TextStyle toBold() {
    return copyWith(fontWeight: FontWeight.bold);
  }

  TextStyle withColor(Color color) {
    return copyWith(color: color);
  }
}
