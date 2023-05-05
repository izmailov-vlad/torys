import '../../../../ui.dart';
import '../../router/auto_router.gr.dart';

@RoutePage()
class MainScreen extends StatelessWidget implements AutoRouteWrapper {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) => AppProvider(child: this);

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        HomeScreenRoute(),
        SearchScreenRoute(),
        FavoriteScreenRoute(),
        ProfileScreenRoute(),
      ],
      transitionBuilder: (context, child, animation) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return BaseScaffold(
          emptyTop: true,
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) => tabsRouter.setActiveIndex(index),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorite',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }
}
