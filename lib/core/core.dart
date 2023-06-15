library core;

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../injection/injection.dart';

import 'data/storage/database_lib.dart';
import 'data/storage/shared_preferences/shared_preferences.dart';
import 'presentation/presentation.dart';
import 'domain/domain.dart';
import 'data/data.dart';

part 'config/app_config.dart';
part 'config/api_keys.dart';