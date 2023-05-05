import '../../../injection/injection.dart';
import '../../../ui.dart';
import '../screens/auth/authorization/bloc/bloc.dart';
import '../screens/book/bloc/bloc.dart';
import '../screens/home/bloc/bloc.dart';
import '../screens/launch/bloc/bloc.dart';
import '../screens/main/bloc/bloc.dart';
import '../screens/profile/bloc/bloc.dart';
import '../screens/search/bloc/bloc.dart';
import '../screens/search/book_search_bloc/bloc.dart';

class AppProvider extends StatefulWidget {
  final Widget child;

  const AppProvider({Key? key, required this.child}) : super(key: key);

  @override
  State<AppProvider> createState() => _AppProviderState();
}

class _AppProviderState extends State<AppProvider> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LaunchBloc>(
          create: (_) =>
              getIt<LaunchBloc>()..add(const LaunchEvent.checkAuth()),
        ),
        BlocProvider<MainBloc>(
          create: (_) => getIt<MainBloc>(),
        ),
        BlocProvider<AuthorizationBloc>(
          create: (_) => getIt<AuthorizationBloc>()
            ..add(
              const AuthorizationEvent.init(),
            ),
        ),
        BlocProvider<HomeBloc>(
          create: (_) => getIt<HomeBloc>()..add(const FetchEvent()),
        ),
        BlocProvider<ProfileBloc>(
          create: (_) => getIt<ProfileBloc>()..add(const ProfileLoad()),
        ),
        BlocProvider<SearchBloc>(
          create: (_) => getIt<SearchBloc>()..add(const SearchLoad()),
        ),
        BlocProvider<BookDetailBloc>(
          create: (_) => getIt<BookDetailBloc>(),
        ),
        BlocProvider<BookSearchBloc>(
          create: (_) => getIt<BookSearchBloc>(),
        ),
      ],
      child: widget.child,
    );
  }
}
