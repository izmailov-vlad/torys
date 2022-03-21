import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:torys/core/presentation/provider/screen.dart';
import 'package:torys/core/presentation/router/bloc/bloc.dart';

import 'bloc/event.dart';

class AppRouterDelegate extends RouterDelegate<RouteInfo>
    with PopNavigatorRouterDelegateMixin<RouteInfo>, ChangeNotifier {
  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RouterBloc, Iterable<RouteInfo>>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, stack) {
        if (stack.isEmpty) return Container();
        var path = '';
        final pages = <TotoPage>[];
        stack.forEach((page) {
          path += page.id;

          pages.add(
            TotoPage(
              id: page.id,
              type: page.type,
              key: ValueKey(path),
              child: WillPopScope(
                onWillPop: () async {
                  return !Navigator.of(context).userGestureInProgress;
                },
                child: page.builder(context),
              ),
            ),
          );
        });
        return Navigator(
          key: navigatorKey,
          pages: pages,
          reportsRouteUpdateToEngine: true,
          onPopPage: (route, result) {
            if (!route.didPop(result)) return false;

            if (route.settings.name != null) {
              context.read<RouterBloc>().add(RouterEvent.pop());
            }
            return true;
          },
        );
      },
    );
  }

  @override
  Future<void> setNewRoutePath(RouteInfo configuration) async {}
}

class TotoPage<T> extends Page<T> {
  TotoPage({
    required this.child,
    required this.type,
    required String id,
    required ValueKey key,
  }) : super(key: key, name: id);

  /// The content to be shown in the [Route] created by this page.
  final Widget child;
  final PageType type;

  @override
  Route<T> createRoute(BuildContext context) {
    var _child = child;

    switch (type) {
      case PageType.screen:
        return MaterialPageRoute<T>(
          settings: this,
          builder: (_) => _child,
        );
      case PageType.dialog:
        return DialogRoute<T>(
          context: context,
          settings: this,
          builder: (_) => _child,
        );
    }
  }
}

enum PageType {
  screen,
  dialog,
}
