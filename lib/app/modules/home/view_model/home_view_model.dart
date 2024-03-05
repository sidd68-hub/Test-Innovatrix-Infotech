import 'package:flutter/material.dart';
import 'package:task_innovatrix_infotech/app/core/routes/app_routes.dart';

class HomeViewModel extends ChangeNotifier {
  void navigateToProfile(BuildContext context) {
    Navigator.of(context).pushNamed(Routes.profile);
  }
}
