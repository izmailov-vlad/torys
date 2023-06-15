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
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          unselectedItemColor: AppColorsScheme.grey1,
          selectedItemColor: AppColorsScheme.mainColor,
          showUnselectedLabels: true),
      shadowColor: AppColorsScheme.shadowColor,
      appBarTheme: const AppBarTheme(
        shadowColor: Colors.transparent,
        backgroundColor: AppColorsScheme.white
      ),
      cardTheme: const CardTheme(
        shadowColor: Colors.transparent,
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: AppTextTheme.titleLarge.copyWith(
          color: AppColorsScheme.red,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        errorStyle: AppTextTheme.titleLarge.copyWith(
          color: AppColorsScheme.red,
        ),
        hintStyle: AppTextTheme.titleLarge.copyWith(
          color: AppColorsScheme.black.withOpacity(0.25),
        ),
      ),
    );
  }
}