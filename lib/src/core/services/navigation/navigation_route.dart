import 'package:flutter/material.dart';
import 'package:todo_app/src/core/constants/navigation/navigation_constants.dart';
import '../../../pages/home/view/home_view.dart';

// Router yapılarının oluşturulduğu kısım
class NavigationRoute {
  NavigationRoute._init();

  static final NavigationRoute _instance = NavigationRoute._init();

  static NavigationRoute get instance => _instance;

  Route<dynamic>? generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case NavigationConstants.home:
        return MaterialPageRoute(
          builder: (context) => const HomeView(),
          settings: RouteSettings(arguments: args),
        );
    }
    return null;
  }
}
