class UserData {
  int? id;
  String name;
  String email;
  String password;
  String mobile;

  UserData(
      {this.id,
      required this.name,
      required this.email,
      required this.mobile,
      required this.password});

  UserData.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        name = res["name"],
        email = res["email"],
        mobile = res["mobile"],
        password = res["password"];
  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'mobile': mobile,
      'password': password
    };
  }
}
