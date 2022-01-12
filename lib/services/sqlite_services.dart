import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import 'package:growth/constants/database_names.dart';

class SQLiteServices {
  static const String databaseName = "growth.db";
  static const int databaseVersion = 1;

  Database? _database;

  SQLiteServices._privateConstructor();
  static final SQLiteServices instance = SQLiteServices._privateConstructor();

  Future<Database?> get database async {
    _database ??= await initDatabase();
    return _database;
  }

  Future<Database> initDatabase() async {
    Directory _directory = await getApplicationDocumentsDirectory();
    String path = join(_directory.path, databaseName);

    return await openDatabase(
      path,
      version: databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute("PRAGMA foreign_keys = ON;");
    await db.execute('''
      CREATE TABLE IF NOT EXISTS ${DatabaseNames.accountTable} ( 
        ${DatabaseNames.id} TEXT PRIMARY KEY NOT NULL, 
        ${DatabaseNames.uid} TEXT NOT NULL,
        ${DatabaseNames.typeID} TEXT NOT NULL,
        ${DatabaseNames.name} TEXT NOT NULL,
        ${DatabaseNames.balance} REAL NOT NULL,
        ${DatabaseNames.currencyCode} TEXT NOT NULL,
        ${DatabaseNames.colorValue} INT NOT NULL
      );
      ''');
  }
}
