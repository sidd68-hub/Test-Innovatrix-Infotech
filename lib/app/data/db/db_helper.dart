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
              email TEXT NOT NULL,
              password TEXT NOT NULL,
              mobile TEXT NOT NULL
            )
            """,
      );
    }, version: 1);
  }

  Future<int> insertUser(UserData user) async {
    int result = await db.insert('users', user.toMap());
    return result;
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
