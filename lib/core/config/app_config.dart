import 'package:dio/dio.dart';
import '../../injection/injection.dart';
import '../data/data.dart';
import 'api_keys.dart';

class AppConfiguration {
  static final AppConfiguration instance = AppConfiguration._();

  factory AppConfiguration() => instance;

  AppConfiguration._();

  Future<void> initConfiguration() async {
    final Dio dio = Dio(BaseOptions(
      baseUrl: ApiKeys.baseUrl,
      sendTimeout: const Duration(milliseconds: 10000),
      connectTimeout: const Duration(milliseconds: 20000),
      contentType: 'application/json',
    ));

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
    dio.interceptors.add(AppInterceptor());

    getIt.registerLazySingleton<Dio>(() => dio);
  }
}
