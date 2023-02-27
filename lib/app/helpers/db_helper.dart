import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite/sql.dart';
import 'package:sqflite/sqlite_api.dart';

class DBHelper {
  static const String nameDB = 'user_places';

  static Future<Database> database() async {
    // duong dan luu csdl
    final dbPath = await sql.getDatabasesPath();
    // get database, if db is null => create db
    final sqlDB = await sql.openDatabase(
      path.join(dbPath, 'places.db'),
      onCreate: (db, version) {
        return db.execute(
            "CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT, image TEXT, loc_lat REAL, loc_lng REAL, address TEXT)");
      },
      version: 1,
    );
    return sqlDB;
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await database();
    // insert data to database
    await db.insert(
      table,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await database();
    // query
    return db.query(table);
  }
}
