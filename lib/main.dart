import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';
import 'package:torys/core/data/storage/database.dart';
import 'package:torys/injection/interceptor.dart';

import 'core/presentation/router/bloc/bloc.dart';
import 'core/presentation/router/router.dart';
import 'core/presentation/screens/authorization/bloc/bloc.dart';
import 'injection/injection.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(FavouritesAdapter());
  await Future.wait([DatabaseStorageHive.init()]);
  await configureInjection(Env.dev);
  await Interceptor().configureNetwork();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('ru', 'RU'),
      ],
      home: BlocProvider<RouterBloc>(
        create: (_) => getIt<RouterEventSink>() as RouterBloc,
        child: MultiBlocProvider(
          providers: [
            BlocProvider<AuthorizationBloc>(
              create: (_) => getIt<AuthorizationBloc>(),
            ),
            // сюда добавлять блоки основных (верхних) экранов приложения
          ],
          child: Router(
            routerDelegate: AppRouterDelegate(),
            backButtonDispatcher: RootBackButtonDispatcher(),
          ),
        ),
      ),
    );
  }
}
