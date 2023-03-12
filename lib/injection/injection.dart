import 'package:get_it/get_it.dart';
import 'package:torys/injection/injection.config.dart';

import '../ui.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureInjection(String environment) async {
  getIt.init();
}

abstract class Env {
  static const dev = 'dev';
  static const prod = 'prod';
  static const test = 'test';
}
