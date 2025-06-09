import 'package:flutter_app1/tugas/tugas_12/participant_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelperDuaBelas {
  static String tableName = "participant";
  static Future<Database> db() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, "tugas_11.db"),
      onCreate: (db, version) {
        return db.execute(''' CREATE TABLE $tableName (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            email TEXT,
            event_name TEXT,
            city TEXT,
            phone_number TEXT,
            gender INTEGER,
            event_date TEXT,
            event_time TEXT,
            registered_at TEXT
          )
          ''');
      },
      version: 1,
    );
  }

  static Future<void> insertData(ParticipantModel data) async {
    Database database = await db();
    await database.insert(
      tableName,
      data.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<ParticipantModel>> getAllData() async {
    Database database = await db();
    List<Map<String, dynamic>> data = await database.query(tableName);
    print(data);
    return data.map((e) {
      return ParticipantModel.fromMap(e);
    }).toList();
  }

  static Future<void> deleteData(int id) async {
    Database database = await db();
    await database.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }

  static Future<void> updateData(ParticipantModel data) async {
    Database database = await db();
    await database.update(
      tableName,
      data.toMap(),
      where: "id = ?",
      whereArgs: [data.id],
    );
  }
}
