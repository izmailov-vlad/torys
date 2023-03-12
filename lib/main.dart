import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:torys/core/config/app_config.dart';
import 'core/presentation/screens.dart';
import 'core/presentation/screens/home/bloc/bloc.dart';
import 'core/presentation/screens/home/bloc/event.dart';
import 'injection/injection.dart';
import 'package:sizer/sizer.dart';
import 'ui.dart';

void main() async {
  await configureInjection(Env.dev);
  await AppConfiguration.instance.initConfiguration();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          theme: AppTheme.appTheme(),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('ru', 'RU'),
          ],
          home: BlocProvider<RouterBloc>(
            create: (_) => getIt<RouterEventSink>() as RouterBloc,
            child: MultiBlocProvider(
              providers: [
                BlocProvider<MainBloc>(
                  create: (_) => getIt<MainBloc>(),
                ),
                BlocProvider<HomeBloc>(
                  create: (_) => getIt<HomeBloc>()..add(const FetchEvent()),
                ),
              ],
              child: Router(
                routerDelegate: AppRouterDelegate(),
                backButtonDispatcher: RootBackButtonDispatcher(),
              ),
            ),
          ),
        );
      }
    );
  }
}
