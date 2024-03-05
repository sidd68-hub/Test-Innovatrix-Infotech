import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_innovatrix_infotech/app/core/routes/app_routes.dart';
import 'package:task_innovatrix_infotech/app/data/db/db_helper.dart';

import 'package:task_innovatrix_infotech/app/data/model/user_data_model.dart';

class LoginViewModel extends ChangeNotifier {
  String email = '';
  String password = '';
  DatabaseHelper db = DatabaseHelper();
  bool _isNavigating = false;

  bool get isNavigating => _isNavigating;

  void setNavigating(bool value) {
    _isNavigating = value;
    notifyListeners();
  }

  void setEmail(String value) {
    email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    password = value;
    notifyListeners();
  }

  bool isLoginEnabled() {
    return email.isNotEmpty && password.isNotEmpty;
  }

  Future<void> login(context) async {
    // setNavigating(true);
    try {
      UserData userData = UserData(email: email, password: password);
      await db.initDB();
      int userExists = await db.checkForUser(userData);
      if (userExists != 0) {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setInt('id', userExists);
        Fluttertoast.showToast(
            msg: "Login Successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        // setNavigating(false);
        Navigator.of(context).pushReplacementNamed(Routes.home);
      } else {
        Fluttertoast.showToast(
            msg: "Please Signup",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } catch (e) {
      print(e);
    }
  }
}
