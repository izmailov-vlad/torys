import '../../../injection/injection.dart';
import '../../../ui.dart';
import '../screens.dart';

class ScreenProvider {
  static RouteInfo main() => RouteInfo(
        id: MainScreen.id,
        builder: (_) => const MainScreen(),
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
