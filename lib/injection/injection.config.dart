// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/data/storage/database.dart' as _i3;
import '../core/presentation/router/bloc/bloc.dart' as _i4;
import '../core/presentation/screens/authorization/bloc/bloc.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.DatabaseStorage>(() => _i3.DatabaseStorageHive());
  gh.singleton<_i4.RouterEventSink>(_i4.RouterBloc());
  gh.factory<_i5.AuthorizationBloc>(
      () => _i5.AuthorizationBloc(get<_i4.RouterEventSink>()));
  return get;
}