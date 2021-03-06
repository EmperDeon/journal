import 'package:flutter/widgets.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState.pushNamed(routeName, arguments: arguments);
  }

  void replaceWith(String routeName, {dynamic arguments}) {
    navigatorKey.currentState
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  bool pop({dynamic result}) {
    return navigatorKey.currentState.pop(result);
  }
}
