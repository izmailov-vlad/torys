import 'package:get_it/get_it.dart';
import 'injection.config.dart';

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
