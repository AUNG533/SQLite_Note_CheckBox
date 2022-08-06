import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  Database? _db;

  DatabaseHelper.internal();

  String noteTable = 'note_table';
  String colId = 'id';
  String colTitle = 'title';
  String colDate = 'date';
  String colPriority = 'priority';
  String colStatus = 'status';

  Future<Database?> get db async {
    _db ??= await _initDb();
    return _db;
    // or
    // if (_db == null) {
    //   _db = await _initDb();
    // }
    // return _db;
  }

  Future<Database> _initDb() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = '${dir.path}todo_list.db';

    final todoListDb = await openDatabase(
      path,
      version: 1,
      onCreate: _createDb,
    );

    return todoListDb;
  }

  void _createDb(Database db, int version) async {
    await db.execute("""
      CREATE TABLE $noteTable (
        $colId INTEGER PRIMARY KEY AUTOINCREMENT,
        $colTitle TEXT,
        $colDate TEXT,
        $colPriority TEXT,
        $colStatus INTEGER
      )
    """);
  }
}
