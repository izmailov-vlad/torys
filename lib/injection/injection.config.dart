// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/data/storage/database.dart' as _i3;
import '../core/presentation/router/bloc/bloc.dart' as _i5;
import '../core/presentation/screens/authorization/bloc/bloc.dart' as _i6;
import '../core/presentation/screens/main/bloc/bloc.dart'
    as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.DatabaseStorage>(() => _i3.DatabaseStorageHive());
  gh.factory<_i4.MainBloc>(() => _i4.MainBloc());
  gh.singleton<_i5.RouterEventSink>(_i5.RouterBloc());
  gh.factory<_i6.AuthorizationBloc>(
      () => _i6.AuthorizationBloc(get<_i5.RouterEventSink>()));
  return get;
}
