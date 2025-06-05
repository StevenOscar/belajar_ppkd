import 'package:flutter_app1/tugas/tugas_11/participant_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelperSebelas {
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
    return data.map((e) {
      return ParticipantModel.fromMap(e);
    }).toList();
  }
}
