import 'package:flutter_app1/study_case/siswa_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelperSiswa {
  static Future<Database> openDb() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, "siswa.db"),
      onCreate: (db, version) {
        return db.execute('''
        CREATE TABLE siswa(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nama TEXT,
            umur INTEGER
          )''');
      },
      version: 1,
    );
  }

  static Future<void> insertSiswa(SiswaModel siswa) async {
    final db = await DbHelperSiswa.openDb();
    await db.insert(
      "siswa",
      siswa.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<SiswaModel>> getAllSiswa() async {
    final db = await DbHelperSiswa.openDb();
    final List<Map<String, dynamic>> maps = await db.query("siswa");
    return List.generate(
      maps.length,
      (index) => SiswaModel.fromMap(maps[index]),
    );
  }
}
