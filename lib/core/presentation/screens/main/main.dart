import '../../../../ui.dart';
import '../../widgets/base/base_scaffold.dart';
import '../favorite/favorite.dart';
import '../home/home.dart';
import '../profile/profile.dart';
import 'bloc/bloc.dart';
import 'bloc/event.dart';
import 'bloc/state.dart';

class MainScreen extends StatefulWidget {
  static const id = '/main';

  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> pages = const [
    HomeScreen(
      key: PageStorageKey<String>(HomeScreen.id),
    ),
    FavoriteScreen(
      key: PageStorageKey<String>(FavoriteScreen.id),
    ),
    ProfileScreen(
      key: PageStorageKey<String>(ProfileScreen.id),
    ),
  ];

  late Widget currentPage;

  final PageStorageBucket _bucket = PageStorageBucket();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    currentPage = pages.first;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      buildWhen: (prev, curr) =>
          curr is MainChangeScreenState || curr is MainInitState,
      builder: (context, state) {
        if (state is MainChangeScreenState) {
          currentPage = pages[state.screenIndex];
        } else {
          currentPage = pages.first;
        }

        return BaseScaffold(
          emptyTop: true,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: pages.indexOf(currentPage),
            onTap: (index) => context.read<MainBloc>().add(ChangeScreen(index)),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: 'Favorite'),
            ],
          ),
          body: PageStorage(
            bucket: _bucket,
            child: currentPage,
          ),
        );
      },
    );
  }
}
