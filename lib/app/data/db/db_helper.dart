import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:task_innovatrix_infotech/app/data/model/user_data_model.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _databaseHelper = DatabaseHelper._();
  DatabaseHelper._();

  late Database db;

  factory DatabaseHelper() {
    return _databaseHelper;
  }
  Future<void> initDB() async {
    String dbPath = await getDatabasesPath();
    db = await openDatabase(join(dbPath, 'user_data.db'),
        onCreate: (database, version) async {
      await database.execute(
        """ CREATE TABLE users (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              name TEXT NOT NULL,
              email TEXT NOT NULL UNIQUE,
              password TEXT NOT NULL,
              mobile TEXT NOT NULL UNIQUE
            )
            """,
      );
    }, version: 1);
  }

  Future<bool> checkForUser(UserData user) async {
    List<Map<String, dynamic>> result = await db.query('users',
        where: "email = ? AND password = ?",
        whereArgs: [user.email, user.password]);
    if (result.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> insertUser(UserData user) async {
    try {
      int result = await db.insert('users', user.toMap());
    } catch (e) {
      print('Error inserting user: $e');
    }
  }

  Future<List<UserData>> retrieveUser() async {
    try {
      final List<Map<String, Object?>> queryResult = await db.query('users');
      return queryResult.map((e) => UserData.fromMap(e)).toList();
    } catch (e) {
      print('Error retrieving users: $e');
      return []; // Return an empty list in case of error
    }
  }

  Future<int> updateUser(UserData user) async {
    int result = await db.update(
      'users',
      user.toMap(),
      where: "id = ?",
      whereArgs: [user.id],
    );
    return result;
  }
}
