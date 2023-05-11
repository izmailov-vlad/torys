part of app_theme;

abstract class AppColorsScheme {
  static ColorScheme appColorScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: mainColor,
      onPrimary: white,
      secondary: secondaryColor,
      onSecondary: white,
      error: red,
      onError: white,
      background: white,
      onBackground: black,
      surface: white,
      onSurface: black,
      shadow: shadowColor,
    );
  }

  static const mainColor = Color(0xFFDA8964);
  static const main1 = Color(0xFFEDC58C);
  static const main4 = Color(0xFFFBF6EF);
  static const secondaryColor = Color(0xFFDA8964);
  static const secondary4 = Color(0xFFFCEFE9);
  static const shadowColor = Color(0x845A1F33);
  static const white = Color(0xFFFFFFFF);
  static const grey = Color(0xFFCCCCCC);
  static const grey1 = Color(0xFF888888);
  static const grey2 = Color(0xFFB8B8B8);
  static const grey3 = Color(0xFFE7E7E7);
  static const grey4 = Color(0xFFF3F3F3);
  static const red = Color(0xFFDC5151);
  static const black = Color(0xFF111111);
  static const darkGrey = Color(0xFFF5F5F5);
  static const brown = Color(0xFF845A1F);
  static const brownOpacity = Color(0x50845A1F);
}
