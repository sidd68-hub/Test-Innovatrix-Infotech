import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_innovatrix_infotech/app/core/navigation/navigation_service.dart';
import 'package:task_innovatrix_infotech/app/core/routes/app_routes.dart';

final navigatorProvider = Provider((ref) => NavigatorService());

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      onGenerateRoute: ref.read(routerProvider).generateRoute,
      initialRoute: Routes.splash,
      debugShowCheckedModeBanner: false,
    );
  }
}
