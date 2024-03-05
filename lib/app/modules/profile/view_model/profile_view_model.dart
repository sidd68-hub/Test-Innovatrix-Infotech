import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_innovatrix_infotech/app/data/db/db_helper.dart';
import 'package:task_innovatrix_infotech/app/data/model/user_data_model.dart';

class ProfileViewModel extends ChangeNotifier {
  DatabaseHelper db = DatabaseHelper();
  String name = '';
  String email = '';
  String password = '';
  String phoneNumber = '';
  int? id;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();

  bool _isLoading = false;
  bool isVisible = true;

  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future getUserData() async {}

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

  Future getId() async {
    setLoading(true);
    await Future.delayed(const Duration(seconds: 2));
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    id = prefs.getInt("id");
    await getUser(id!);
  }

  Future getUser(int id) async {
    List<UserData> userData = await db.retrieveUserById(id);
    nameController.text = userData[0].name!;
    name = userData[0].name!;
    emailController.text = userData[0].email!;
    email = userData[0].email!;
    passwordController.text = userData[0].password!;
    password = userData[0].password!;
    phoneController.text = userData[0].mobile!;
    phoneNumber = userData[0].mobile!;
    setLoading(false);
  }

  void isShowPassword() {
    isVisible = !isVisible;
    notifyListeners();
  }

  void updateDb() async {
    setLoading(true);
    UserData userData = UserData(
        id: id,
        name: name,
        email: email,
        password: password,
        mobile: phoneNumber);
    db.updateUser(userData);
    setLoading(false);
    getUser(id!);
  }
}
