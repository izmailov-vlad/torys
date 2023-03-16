library data;

import 'package:either_dart/either.dart';

import '../../ui.dart';
import '../../utils/app_logger.dart';

/// utils
import '../../utils/result.dart';

/// injection
import 'package:injectable/injectable.dart';

/// network
import 'package:dio/dio.dart';

import '../domain/domain.dart';

import 'network/dto/author.dart';
import 'network/dto/book.dart';
import 'network/dto/books.dart';
import 'network/dto/user.dart';
import 'network/dto/genre.dart';
import 'network/dto/genres.dart';

part '../data/network/dto/exception.dart';

part '../data/network/service/books.dart';

part '../data/network/interceptor.dart';

part '../data/repository/books.dart';

part '../data/repository/user.dart';

part '../data/adapters/book.dart';

part '../data/adapters/genre.dart';

part '../data/network/app_client.dart';
