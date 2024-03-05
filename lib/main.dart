import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_innovatrix_infotech/app/core/navigation/navigation_service.dart';
import 'package:task_innovatrix_infotech/app/core/routes/app_routes.dart';
import 'package:task_innovatrix_infotech/app/data/db/db_helper.dart';

final navigatorProvider = Provider((ref) => NavigatorService());
late DatabaseHelper db;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  db = DatabaseHelper();
  await db.initDB();
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
