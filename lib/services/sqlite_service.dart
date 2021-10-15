import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import 'package:growth/constants/sqlite_names.dart';

/// [SQLiteHelper] provides a way to initialize the SQLite Database.
class SQLiteHelper {
  static const String databaseName = "growth.db";
  static const databaseVersion = 1;
  Database? _database;

  // Create an instance of helperDB
  SQLiteHelper._privateConstructor();
  static final SQLiteHelper instance = SQLiteHelper._privateConstructor();

  Future<Database?> get database async {
    _database ??= await initDatabase();
    return _database;
  }

  Future<Database> initDatabase() async {
    Directory _directory = await getApplicationDocumentsDirectory();
    String path = join(_directory.path, databaseName);
    return await openDatabase(path,
        version: databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute("PRAGMA foreign_keys = ON;");
    await db.execute('''
      CREATE TABLE IF NOT EXISTS ${SQLiteNames.accountTable} ( 
        ${SQLiteNames.id} TEXT PRIMARY KEY NOT NULL, 
        ${SQLiteNames.userId} TEXT NOT NULL,
        ${SQLiteNames.accountTypeId} TEXT NOT NULL,
        ${SQLiteNames.name} TEXT NOT NULL,
        ${SQLiteNames.balance} REAL NOT NULL,
        ${SQLiteNames.currencyFlag} TEXT NOT NULL,
        ${SQLiteNames.currencyCode} TEXT NOT NULL,
        ${SQLiteNames.colorValue} INT NOT NULL
      );
      ''');
  }
}
