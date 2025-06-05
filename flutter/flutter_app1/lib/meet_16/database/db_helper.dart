import 'package:flutter_app1/meet_16/models/user_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static Future<Database> initDb() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, "ppkd_b_2.db"),
      onCreate: (db, version) {
        return db.execute(''' CREATE TABLE users(
            ID INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            username TEXT,
            email TEXT,
            phone TEXT,
            password TEXT
            )''');
      },
      version: 1,
    );
  }

  static Future<void> registerUser({UserModel? data}) async {
    final db = await initDb();

    await db.insert("users", {
      'name': data?.name,
      'username': data?.username,
      'email': data?.email,
      'phone': data?.phone,
      'password': data?.password,
    }, conflictAlgorithm: ConflictAlgorithm.replace);
    print("user registered successfully");
  }

  static Future<UserModel?> login({
    required String email,
    required String password,
  }) async {
    final db = await initDb();

    final List<Map<String, dynamic>> data = await db.query(
      "users",
      where: "email = ? AND password = ?",
      whereArgs: [email, password],
    );
    if (data.isNotEmpty) {
      return UserModel.fromMap(data.first);
    } else {
      return null;
    }
  }
}
