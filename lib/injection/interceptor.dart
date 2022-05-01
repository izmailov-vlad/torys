import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:torys/core/data/network/torys_client.dart';

import 'package:torys/injection/injection.dart';

class Interceptor {
  Future configureNetwork() async {
    final dio = Dio(); // Provide a dio instance
    dio.options.headers["Content-Type"] = 'application/json';
    dio.options.followRedirects = false;
    dio.options.validateStatus = (status) {
      return status! < 500;
    };
    final client = TorysClient(dio);

    getIt.registerLazySingleton<TorysClient>(
      () => client,
    );
  }
}
