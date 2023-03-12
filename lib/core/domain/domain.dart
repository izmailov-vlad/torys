library domain;

/// TO IMPORT

/// utils
import '../../utils/result.dart';

/// injection
import 'package:injectable/injectable.dart';

/// data
import 'package:torys/core/data/storage/database.dart';

import '../data/data.dart';
import '../data/network/dto/user.dart';
/// models

import 'package:equatable/equatable.dart';

/// DATA
import '../data/network/dto/user.dart';
import '../data/network/dto/book.dart';

///PRESENTATION
import '../presentation/entities/genre.dart';


/// db
import '../data/storage/database.dart';

/// TO PART OF
part '../domain/usecases/register.dart';

part '../domain/usecases/login.dart';

part '../domain/usecases/genres.dart';

part '../domain/repository/user_repository.dart';

part '../domain/repository/books_repository.dart';

part '../domain/adapters/user.dart';

part '../domain/adapters/genre.dart';

part '../domain/models/book.dart';

part '../domain/models/user.dart';

part '../domain/models/genre.dart';
