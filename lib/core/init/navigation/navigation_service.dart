import 'package:flutter/material.dart';

import 'INavigation_service.dart';

class NavigationService implements INavigationService {
  static NavigationService _instance = NavigationService._init();
  static NavigationService get instance => _instance;

  NavigationService._init();

  RoutePredicate get removeAllOldRoutes => (Route<dynamic> route) => false;
  @override
  Future<void> navigateToPage({required String path, Object? data}) async {
    await navigatorKey.currentState!.pushNamed(path, arguments: data);
  }

  @override
  void popPage() {
    navigatorKey.currentState!.pop();
  }

  @override
  Future<void> navigateToPageClear({required String path, Object? data}) async {
    await navigatorKey.currentState!
        .pushNamedAndRemoveUntil(path, removeAllOldRoutes, arguments: data);
  }

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
}
