import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_route/src/route/route_config.dart';

import 'auto_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Route')
class AppRouter extends $AppRouter {
  static const String launchScreen = '/';
  static const String authorizationScreen = '/authorization';
  static const String booksScreen = '/books';
  static const String mainScreen = '/main';
  static const String homeScreen = 'home';
  static const String bookDetailScreen = '/bookDetails';
  static const String webView = '/googleWebView';
  static const String searchScreen = 'search';
  static const String favoriteScreen = 'favorite';
  static const String profileScreen = 'profile';
  static const String profileEditScreen = '/profile_edit';
  static const String commentModal = 'commentModal';

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: LaunchScreenRoute.page,
        ),
        AutoRoute(
          path: authorizationScreen,
          page: AuthorizationScreenRoute.page,
        ),
        AutoRoute(
          path: booksScreen,
          page: BooksPageRoute.page,
        ),
        AutoRoute(
          path: bookDetailScreen,
          page: BookDetailPageRoute.page,
        ),
        AutoRoute(
          path: webView,
          page: BaseWebViewRoute.page,
        ),
        AutoRoute(
          page: ProfileEditScreenRoute.page,
          path: profileEditScreen,
        ),
        AutoRoute(
          path: mainScreen,
          page: MainScreenRoute.page,
          children: [
            AutoRoute(
              path: homeScreen,
              page: HomeScreenRoute.page,
            ),
            AutoRoute(path: searchScreen, page: SearchScreenRoute.page),
            AutoRoute(path: favoriteScreen, page: FavoriteScreenRoute.page),
            AutoRoute(
              path: profileScreen,
              page: ProfileScreenRoute.page,
            ),
          ],
        ),
      ];
}
