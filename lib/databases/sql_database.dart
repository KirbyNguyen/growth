import 'package:growth/constants/database_names.dart';
import 'package:growth/databases/db_helper.dart';
import 'package:growth/models/financial_account.dart';
import 'package:growth/services/sqlite_services.dart';
import 'package:sqflite/sqlite_api.dart';

class SQLiteDatabase extends DBHelper {
  late Database? _db;
  final SQLiteServices _service;
  SQLiteDatabase(this._service);

  Future init() async {
    _db = await _service.database;
  }

  /* ========================================================
  Financial Account Database SQLite Functions
  ======================================================== */
  @override
  Future<List<FinancialAccount>> getAllAccounts(String uid) async {
    final dataList = await _db!.query(
      DatabaseNames.accountTable,
      where: "${DatabaseNames.uid} = ?",
      whereArgs: [uid],
    );

    if (dataList.isEmpty) return [];
    return dataList.map((data) => FinancialAccount.fromJson(data)).toList();
  }

  @override
  Future<FinancialAccount> getOneAccount(String id) async {
    final dataList = await _db!.query(
      DatabaseNames.accountTable,
      where: "${DatabaseNames.id} = ?",
      whereArgs: [id],
    );

    return FinancialAccount.fromJson(dataList[0]);
  }

  @override
  Future<int> insertAccount(FinancialAccount account) async {
    return await _db!.insert(
      DatabaseNames.accountTable,
      account.toJson(),
    );
  }

  @override
  Future<int> updateAccount(FinancialAccount account) async {
    return await _db!.update(
      DatabaseNames.accountTable,
      account.toJson(),
      where: "${DatabaseNames.id} = ?",
      whereArgs: [account.id],
    );
  }

  @override
  Future<int> deleteAccount(String id) async {
    return await _db!.delete(
      DatabaseNames.accountTable,
      where: "${DatabaseNames.id} = ?",
      whereArgs: [id],
    );
  }
}
