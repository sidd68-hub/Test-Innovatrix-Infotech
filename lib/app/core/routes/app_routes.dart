// routes.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_innovatrix_infotech/app/modules/home/view/home_screen.dart';
import 'package:task_innovatrix_infotech/app/modules/login/view/login_screen.dart';
import 'package:task_innovatrix_infotech/app/modules/profile/view/profile_screen.dart';
import 'package:task_innovatrix_infotech/app/modules/signup/view/signup_view.dart';
import 'package:task_innovatrix_infotech/app/modules/splash/view/splash_screen.dart';

final routerProvider = Provider((ref) => Routes());

class Routes {
  static const String splash = '/';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/home';
  static const String profile = '/profile';

  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case signup:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());

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
