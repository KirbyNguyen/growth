import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import 'package:growth/constants/sqlite_names.dart';

class SQLiteHelper {
  static const String databaseName = "growth.db";
  static const int databaseVersion = 1;

  late Database? _database;

  SQLiteHelper._privateConstructor();
  static final SQLiteHelper instance = SQLiteHelper._privateConstructor();

  Future<Database?> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  Future<Database> _initDatabase() async {
    Directory _directory = await getApplicationDocumentsDirectory();
    String path = join(_directory.path, databaseName);
    return await openDatabase(path,
        version: databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute("PRAGMA foreign_keys = ON;");

    // await db.execute('''
    //   CREATE TABLE ${SQLiteNames.accountTypeTable} (
    //     ${SQLiteNames.id} TEXT PRIMARY KEY,
    //     ${SQLiteNames.uId} TEXT,
    //     ${SQLiteNames.name} TEXT NOT NULL,
    //     ${SQLiteNames.iconPoint} INTEGER NOT NULL,
    //     ${SQLiteNames.iconFamily} TEXT NOT NULL
    //   );''');
    await db.execute('''
      CREATE TABLE ${SQLiteNames.accountTable}( 
        ${SQLiteNames.id} TEXT PRIMARY KEY NOT NULL, 
        ${SQLiteNames.userId} TEXT NOT NULL,
        ${SQLiteNames.accountTypeId} TEXT NOT NULL,
        ${SQLiteNames.name} TEXT NOT NULL,
        ${SQLiteNames.balance} REAL NOT NULL,
        ${SQLiteNames.currencyFlag} TEXT NOT NULL,
        ${SQLiteNames.currencyCode} TEXT NOT NULL,
        ${SQLiteNames.colorValue} INT NOT NULL,
      );
      ''');

    // for (AccountType item in ExistingTypeList.list) {
    //   await db.insert(SQLiteNames.accountTypeTable, item.toMap());
    // }
  }
}
