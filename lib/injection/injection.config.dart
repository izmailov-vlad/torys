// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/data/network/service/books.dart' as _i5;
import '../core/data/network/torys_client.dart' as _i4;
import '../core/data/repository/books.dart' as _i3;
import '../core/data/repository/user.dart' as _i9;
import '../core/data/storage/database.dart' as _i6;
import '../core/domain/usecases/login.dart' as _i10;
import '../core/domain/usecases/register.dart' as _i11;
import '../core/presentation/router/bloc/bloc.dart' as _i8;
import '../core/presentation/screens/authorization/bloc/bloc.dart' as _i12;
import '../core/presentation/screens/main/bloc/bloc.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.BooksRepository>(
      () => _i3.BooksRepositoryImpl(get<_i4.TorysClient>()));
  gh.factory<_i5.BooksService>(
      () => _i5.BookServiceImpl(get<_i4.TorysClient>()));
  gh.factory<_i6.DatabaseStorage>(() => _i6.DatabaseStorageHive());
  gh.factory<_i7.MainBloc>(() => _i7.MainBloc());
  gh.singleton<_i8.RouterEventSink>(_i8.RouterBloc());
  gh.factory<_i9.UserRepository>(
      () => _i9.UserRepositoryImpl(get<_i4.TorysClient>()));
  gh.factory<_i10.LogInUseCase>(() => _i10.LogInUseCaseImpl(
      get<_i9.UserRepository>(), get<_i6.DatabaseStorage>()));
  gh.factory<_i11.RegisterUseCase>(() => _i11.RegisterUseCaseImpl(
      get<_i9.UserRepository>(), get<_i6.DatabaseStorage>()));
  gh.factory<_i12.AuthorizationBloc>(() => _i12.AuthorizationBloc(
      get<_i10.LogInUseCase>(),
      get<_i11.RegisterUseCase>(),
      get<_i8.RouterEventSink>()));
  return get;
}
