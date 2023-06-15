part of core;

class AppConfiguration {
  static final AppConfiguration instance = AppConfiguration._();

  factory AppConfiguration() => instance;

  AppConfiguration._();

  Future<void> initConfiguration() async {
    final Dio withTokenDio = Dio(
      BaseOptions(
        baseUrl: ApiKeys.baseUrl,
        sendTimeout: const Duration(milliseconds: 10000),
        connectTimeout: const Duration(milliseconds: 20000),
        contentType: 'application/json',
        responseType: ResponseType.json,
      ),
    );

    final Dio withoutTokenDio = Dio(
      BaseOptions(
        baseUrl: ApiKeys.baseUrl,
        sendTimeout: const Duration(milliseconds: 10000),
        connectTimeout: const Duration(milliseconds: 20000),
        contentType: 'application/json',
        responseType: ResponseType.json,
      ),
    );

    ///-------------------------------------------------------------
    /// interceptors
    /// ------------------------------------------------------------
    ///
    ///
    final prefs = await SharedPreferences.getInstance();
    final appDatabase = AppDatabase();
    getIt.registerSingleton<Dio>(
      withoutTokenDio,
      instanceName: 'withoutTokenDio',
    );
    getIt.registerSingleton<SharedPreferences>(prefs);

    getIt.registerSingleton<Dio>(withTokenDio, instanceName: 'withTokenDio');
    getIt.registerSingleton<AppDatabase>(appDatabase);
    withTokenDio.interceptors.add(getIt.get<AppInterceptor>());
    withoutTokenDio.interceptors.add(getIt.get<WithoutTokenInterceptor>());
  }
}
