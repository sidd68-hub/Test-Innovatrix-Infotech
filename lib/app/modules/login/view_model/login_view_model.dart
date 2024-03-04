import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  String email = '';
  String password = '';

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

  void login() {
    // Add your login logic here
    print('Logging in with: $email, $password');
  }
}
