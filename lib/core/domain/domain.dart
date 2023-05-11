library domain;

import 'package:drift/drift.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../data/storage/database_lib.dart';

/// models

import 'package:equatable/equatable.dart';

/// DATA

import '../data/storage/secure_storage/secure_storage.dart';

/// DATA
import '../data/data.dart';

///PRESENTATION

import '../presentation/presentation.dart';

/// TO PART OF

export 'usecases/usecase.dart';

/// usecases params

part 'usecases/book/book_by_id/params.dart';

part 'usecases/book/book_comments/params.dart';

part 'usecases/book/book_rate/params.dart';

part 'usecases/book/books_by_category_id/params.dart';

part 'usecases/authorization/register/params.dart';

part 'usecases/authorization/google_login/params.dart';

part 'usecases/authorization/login/params.dart';

part 'usecases/user/save_user/params.dart';

/// usecases

part 'usecases/authorization/register/register.dart';

part 'usecases/authorization/login/login.dart';

part 'usecases/authorization/google_login/google_login.dart';

part 'usecases/authorization/logout.dart';

part 'usecases/user/user.dart';

part 'usecases/user/save_user/save_user.dart';

part 'usecases/book/book_comments/book_comments.dart';

part 'usecases/book/book_rate/book_rate.dart';

part 'usecases/book/book_change_comment_like_status/book_change_comment_like_status.dart';

part 'usecases/book/book_change_comment_like_status/params.dart';

part 'usecases/book/books_by_categories.dart';

part 'usecases/book/categories.dart';

part 'usecases/book/books_by_category_id/books_by_category_id.dart';

part 'usecases/book/book_by_id/book_by_id.dart';

part 'usecases/authorization/check_auth.dart';

part 'usecases/book/popular_books.dart';

part 'usecases/book/book_add_comment/book_add_comment.dart';

part 'usecases/book/book_add_comment/params.dart';

part 'usecases/book/book_change_favorite/book_change_favorite.dart';

part 'usecases/book/book_change_favorite/params.dart';

part 'usecases/book/books_by_query/params.dart';

part 'usecases/book/books_by_query/books_by_query.dart';

part 'usecases/book/new_books.dart';

part 'usecases/book/user_favorite_book.dart';

part 'usecases/authorization/refresh_token.dart';

/// repository
part '../domain/repository/user_repository.dart';

part '../domain/repository/google_auth_repository.dart';

part '../domain/repository/books_repository.dart';

/// adapters
part 'adapters/user.dart';

part 'adapters/category.dart';

part 'adapters/book/book.dart';

part 'adapters/book/volume_info.dart';

part 'adapters/book/access_info.dart';

part 'adapters/book/books.dart';

part 'adapters/book/comment.dart';

part 'adapters/book/comments.dart';

part 'adapters/book/image_links.dart';

part 'adapters/book/category_books.dart';

part 'adapters/book/categories_books.dart';

part 'adapters/authorization/auth.dart';

part 'adapters/authorization/google_auth.dart';

part 'adapters/authorization/refresh_token.dart';

part 'adapters/authorization/logout.dart';

part 'adapters/authorization/register.dart';

/// models
part 'models/book/book.dart';

part 'models/book/categories_books.dart';

part 'models/book/books.dart';

part 'models/book/comment.dart';

part 'models/book/comments.dart';

part 'models/book/access_info.dart';

part 'models/book/volume_info.dart';

part 'models/book/image_links.dart';

part 'models/user.dart';

part 'models/authorization/auth.dart';

part 'models/authorization/logout.dart';

part 'models/authorization/google_auth.dart';

part 'models/authorization/refresh_token.dart';

part 'models/authorization/register.dart';

part 'models/book/category.dart';

part 'models/book/category_books.dart';
