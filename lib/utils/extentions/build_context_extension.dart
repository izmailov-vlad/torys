import 'package:flutter/material.dart';


extension BuildContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  Size get screenSize => MediaQuery.of(this).size;
  // TODO add router
  // void popUntil(
  //     bool Function(Route<dynamic>) predicate,
  //     ) =>
  //     router.popUntil(predicate);


  void unfocus() => FocusScope.of(this).unfocus();

  void requestFocus([FocusNode? node]) => FocusScope.of(this).requestFocus(node);

  void nextFocus() => FocusScope.of(this).nextFocus();

  void pushNamedAndRemoveUntil(String path) => Navigator.of(this).pushNamedAndRemoveUntil(
    path,
        (_) => false,
  );

  // void push(RouteInfo route) => router.push(route);
  //
  // void replace(RouteInfo route) => router.replace(route);
  //
  // void replaceAll(List<RouteInfo> routes) => router.replaceAll(routes);
  //
  // void popAndPush(RouteInfo route) => router.popAndPush(route);
  //
  // void pop<T>([T? result]) => router.pop(result);
  //
  // bool canPop() => router.canPop();
  //
  // void forcePop<T>([T? result]) => router.popForced(result);
  //
  // void navigate(PageRouteInfo route) => router.navigate(route);

  double widthByPercent(double percent) {
    assert(percent >= 0 && percent <= 100);

    return (screenSize.width * percent) / 100;
  }

  double heightByPercent(double percent) {
    assert(percent >= 0 && percent <= 100);

    return (screenSize.height * percent) / 100;
  }
}

