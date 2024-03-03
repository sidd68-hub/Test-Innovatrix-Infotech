// routes.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_innovatrix_infotech/app/modules/login/view/login_screen.dart';
import 'package:task_innovatrix_infotech/app/modules/splash/view/splash_screen.dart';

final routerProvider = Provider((ref) => Routes());

class Routes {
  static const String splash = '/';
  static const String home = '/home';
  static const String login = '/login';

  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      default:
        return MaterialPageRoute(builder: (_) => const UnknownScreen());
    }
  }
}

class UnknownScreen extends StatelessWidget {
  const UnknownScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
