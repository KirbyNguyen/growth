import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'package:growth/constants/sqlite_names.dart';
import 'package:growth/constants/existing_type_list.dart';

import 'package:growth/models/account_type.dart';

class SQLiteHelper {
  static const String databaseName = "growth.db";
  static const int databaseVersion = 1;

  Database? _database;

  Future<Database> initDatabase() async {
    Directory _directory = await getApplicationDocumentsDirectory();
    String path = join(_directory.path, databaseName);
    return await openDatabase(path,
        version: databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute("PRAGMA foreign_keys = ON;");

    await db.execute('''
      CREATE TABLE ${SQLiteNames.accountTypeTable} ( 
        ${SQLiteNames.id} TEXT PRIMARY KEY, 
        ${SQLiteNames.uId} TEXT,
        ${SQLiteNames.name} TEXT NOT NULL,
        ${SQLiteNames.iconPoint} INTEGER NOT NULL,
        ${SQLiteNames.iconFamily} TEXT NOT NULL
      );

      CREATE TABLE ${SQLiteNames.accountTable}( 
        ${SQLiteNames.id} TEXT PRIMARY KEY NOT NULL, 
        ${SQLiteNames.uId} TEXT NOT NULL,
        ${SQLiteNames.accountTypeId} TEXT NOT NULL,
        ${SQLiteNames.name} TEXT NOT NULL,
        ${SQLiteNames.balance} REAL NOT NULL,
        ${SQLiteNames.currencyFlag} TEXT NOT NULL,
        ${SQLiteNames.currencyCode} TEXT NOT NULL,
        FOREIGN KEY(${SQLiteNames.accountTypeTable}) REFERENCES ${SQLiteNames.accountTypeTable}(${SQLiteNames.accountTypeTable})
      );
      ''');

    for (AccountType item in ExistingTypeList.list) {
      await db.insert(SQLiteNames.accountTypeTable, item.toMap());
    }
  }
}
