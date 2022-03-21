import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:torys/injection/injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureInjection(String environment) async {
  $initGetIt(getIt, environment: environment);
}

abstract class Env {
  static const dev = 'dev';
  static const prod = 'prod';
  static const test = 'test';
}
