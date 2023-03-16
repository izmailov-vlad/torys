part of app_theme;

abstract class AppTheme {
  static ThemeData appTheme() {
    return ThemeData(
      fontFamily: 'Open Sans',
      primaryColor: AppColorsScheme.mainColor,
      colorScheme: AppColorsScheme.appColorScheme(),
      textTheme: AppTextTheme.appTextTheme(),
      scaffoldBackgroundColor: AppColorsScheme.main4,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.resolveWith(
            (states) {
              return AppTextTheme.headlineLarge;
            },
          ),
          backgroundColor: MaterialStateProperty.resolveWith(
            (states) {
              return AppColorsScheme.mainColor;
            },
          ),
          shadowColor: MaterialStateProperty.resolveWith(
            (states) {
              return AppColorsScheme.brown;
            },
          ),
          shape: MaterialStateProperty.resolveWith(
            (states) {
              return const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              );
            },
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.resolveWith(
            (states) {
              return AppTextTheme.headlineLarge;
            },
          ),
          backgroundColor: MaterialStateProperty.resolveWith(
            (states) {
              return AppColorsScheme.mainColor;
            },
          ),
          shadowColor: MaterialStateProperty.resolveWith(
            (states) {
              return AppColorsScheme.brown;
            },
          ),
          shape: MaterialStateProperty.resolveWith(
            (states) {
              return const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(),
      shadowColor: AppColorsScheme.shadowColor,
      appBarTheme: AppBarTheme(shadowColor: Colors.transparent),
      cardTheme: CardTheme(
        shadowColor: Colors.transparent,
      ),
    );
  }
}
