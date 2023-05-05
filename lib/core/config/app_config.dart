part of core;
class AppConfiguration {
  static final AppConfiguration instance = AppConfiguration._();

  factory AppConfiguration() => instance;

  AppConfiguration._();

  Future<void> initConfiguration() async {
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: ApiKeys.baseUrl,
        sendTimeout: const Duration(milliseconds: 10000),
        connectTimeout: const Duration(milliseconds: 20000),
        contentType: 'application/json',
        responseType: ResponseType.json,
      ),
    );

    // final Dio tokenDio = Dio(BaseOptions(
    //   baseUrl: CoreConstants.baseUrl,
    //   sendTimeout: 10000,
    //   connectTimeout: 20000,
    //   contentType: 'application/json',
    // ));
    // final Dio authDio = Dio(BaseOptions(
    //   baseUrl: CoreConstants.baseUrl,
    //   sendTimeout: 10000,
    //   connectTimeout: 20000,
    //   contentType: 'application/json',
    // ))

    ///-------------------------------------------------------------
    /// interceptors
    /// ------------------------------------------------------------
    ///
    ///
    final appDatabase = AppDatabase();

    getIt.registerSingleton<Dio>(dio);
    getIt.registerSingleton<AppDatabase>(appDatabase);
    dio.interceptors.add(getIt.get<AppInterceptor>());
  }
}
