library data;

import '../../inject_package.dart';
import '../../utils/app_logger.dart';

/// network
import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

/// CORE
import '../core.dart';
/// DOMAIN
import '../domain/domain.dart';

/// db
import 'storage/secure_storage/secure_storage.dart';
import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'storage/database.dart';

/// DTO
part 'network/dto/user/user.dart';

part 'network/dto/search_params/pagination.dart';

part 'network/dto/search/request/search.dart';

part 'network/dto/search/response/search.dart';

part 'network/dto/auth/request/auth.dart';

part 'network/dto/google_auth/response/google_auth.dart';

part 'network/dto/auth/response/auth.dart';

part 'network/dto/logout/logout.dart';

part 'network/dto/register/request/register.dart';

part 'network/dto/register/response/register.dart';

part 'network/dto/refresh/request/refresh.dart';

part 'network/dto/refresh/response/refresh.dart';

part 'network/dto/book/book.dart';

part 'network/dto/book/books.dart';

part 'network/dto/book/image_links.dart';

part 'network/dto/book/categories.dart';

part 'network/dto/book/category.dart';

part 'network/dto/book/category_books.dart';

part 'network/dto/book/categories_books.dart';

part 'network/dto/book/volume_info.dart';

part 'data.g.dart';

/// EXCEPTION
part 'network/dto/error/exception.dart';

/// SERVICE
part 'network/service/auth_service.dart';

part 'network/service/google_auth_service.dart';

part 'network/service/books_service.dart';

part 'network/app_client.dart';

part 'network/interceptor.dart';

/// REPOSITORY
part 'repository/books.dart';

part 'repository/auth.dart';

part 'repository/google_auth.dart';

/// ADAPTERS
part 'adapters/book/book.dart';

part 'adapters/book/category_books.dart';

part 'adapters/book/volume_info.dart';

part 'adapters/book/books.dart';

part 'adapters/book/categories_books.dart';

part 'adapters/book/image_links.dart';

part 'adapters/authorization/auth.dart';

part 'adapters/authorization/register.dart';

part 'adapters/authorization/google_auth.dart';

part 'adapters/authorization/logout.dart';

part 'adapters/authorization/refresh_token.dart';

part 'adapters/genre.dart';

