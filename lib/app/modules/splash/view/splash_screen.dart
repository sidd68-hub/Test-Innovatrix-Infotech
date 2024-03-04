import 'package:flutter/material.dart';
import 'package:task_innovatrix_infotech/app/core/routes/app_routes.dart';
import 'package:task_innovatrix_infotech/app/core/values/app_assets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final navigatorService = ref.read(navigatorProvider);
    Future.delayed(const Duration(seconds: 3), () async {
      await Navigator.of(context).pushReplacementNamed(Routes.login);
    });
    return Scaffold(
      body: Center(child: Image.asset(AppAssets.logo, fit: BoxFit.fitHeight)),
    );
  }
}
