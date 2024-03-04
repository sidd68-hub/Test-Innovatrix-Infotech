import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task_innovatrix_infotech/app/core/routes/app_routes.dart';
import 'package:task_innovatrix_infotech/app/data/db/db_helper.dart';
import 'package:task_innovatrix_infotech/app/data/model/user_data_model.dart';

class SignUpViewModel extends ChangeNotifier {
  DatabaseHelper db = DatabaseHelper();
  String name = '';
  String email = '';
  String password = '';
  String phoneNumber = '';

  void setName(String value) {
    name = value;
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

  void setPhoneNumber(String value) {
    phoneNumber = value;
    notifyListeners();
  }

  bool isSignUpEnabled() {
    return name.isNotEmpty &&
        email.isNotEmpty &&
        password.isNotEmpty &&
        phoneNumber.isNotEmpty;
  }

  Future signUp(BuildContext context) async {
    UserData userData = UserData(
        name: name, email: email, mobile: phoneNumber, password: password);
    try {
      await db.insertUser(userData);
      Fluttertoast.showToast(
          msg: "SignUp Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      name = '';
      password = '';
      email = '';
      phoneNumber = '';
      Navigator.of(context).pushReplacementNamed(Routes.login);
    } catch (e) {
      print("Exception $e");
    }
  }
}
