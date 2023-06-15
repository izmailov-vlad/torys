import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/core.dart';
import 'core/presentation/router/auto_router.dart';
import 'injection/injection.dart';
import 'package:sizer/sizer.dart';
import 'ui.dart';

void main() async {
  await configureInjection(Env.dev);
  WidgetsFlutterBinding.ensureInitialized();
  await AppConfiguration.instance.initConfiguration();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp.router(
          routerConfig: _appRouter.config(),
          theme: AppTheme.appTheme(),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('ru', 'RU'),
          ],
        );
      },
    );
  }
}
