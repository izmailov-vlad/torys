import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:torys/core/presentation/router/router.dart';
import 'package:torys/core/presentation/screens/authorization/authoriation.dart';
import 'package:torys/core/presentation/screens/authorization/bloc/bloc.dart';
import 'package:torys/core/presentation/screens/main/bloc/bloc.dart';
import 'package:torys/core/presentation/screens/main/main.dart';
import 'package:torys/injection/injection.dart';

class ScreenProvider {
  static RouteInfo splash() => RouteInfo(
        id: AuthorizationScreen.id,
        builder: (_) => BlocProvider<AuthorizationBloc>(
          create: (_) => getIt<AuthorizationBloc>(),
          child: const AuthorizationScreen(),
        ),
      );

  static RouteInfo main() => RouteInfo(
        id: MainScreen.id,
        builder: (_) => BlocProvider<MainBloc>(
          create: (_) => getIt<MainBloc>(),
          child: MainScreen(),
        ),
      );
}

class RouteInfo {
  RouteInfo({
    required this.id,
    this.type = PageType.screen,
    required this.builder,
  });

  final String id;
  final WidgetBuilder builder;
  PageType type;

  @override
  String toString() {
    return 'Route{id: $id, builder: $builder}';
  }
}
