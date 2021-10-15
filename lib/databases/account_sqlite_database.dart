import 'package:growth/constants/sqlite_names.dart';
import 'package:growth/databases/sqlite_database.dart';
import 'package:growth/models/account_db_helper.dart';
import 'package:growth/models/balance_account.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sqflite/sqflite.dart';

/// Provides an instance of [AccountSQLiteDB].
final sqliteProvider =
    Provider<AccountSQLiteDB>((ref) => AccountSQLiteDB(SQLiteHelper.instance));

/// [AccountSQLiteDB] provides function to manipulate
/// Account Table in the SQLiteDB.
class AccountSQLiteDB extends AccountDBHelper {
  final SQLiteHelper _sqliteHelper;
  AccountSQLiteDB(this._sqliteHelper);

  /// Returns all [BalanceAccount] in the SQLite DB of a [User].
  @override
  Future<List<BalanceAccount>> getAll(String userId) async {
    Database? db = await _sqliteHelper.database;
    final maps = await db!.query(SQLiteNames.accountTable,
        where: "${SQLiteNames.userId} = ?", whereArgs: [userId]);
    if (maps.isEmpty) return [];
    return maps.map((map) => BalanceAccount.fromMap(map)).toList();
  }

  /// Takes a [String] as an id to retrieve a [BalanceAccount] in the SQLite DB.
  @override
  Future<BalanceAccount> getOne(String id) async {
    Database? db = await _sqliteHelper.database;
    final map = await db!.query(SQLiteNames.accountTable,
        where: "${SQLiteNames.id} = ?", whereArgs: [id]);
    return BalanceAccount.fromMap(map[0]);
  }

  /// Insert a [BalanceAccount] into the SQLite DB.
  @override
  Future insert(BalanceAccount account) async {
    Database? db = await _sqliteHelper.database;
    int result = await db!.insert(SQLiteNames.accountTable, account.toMap());
    return result;
  }

  /// Update a [BalanceAccount] into the SQLite DB.
  @override
  Future update(BalanceAccount account) async {
    Database? db = await _sqliteHelper.database;

    return await db!.update(
      SQLiteNames.accountTable,
      account.toMap(),
      where: "${SQLiteNames.id} = ?",
      whereArgs: [account.id],
    );
  }

  /// Takes [String] as an id to delete the [BalanceAccount] in the SQLite DB.
  @override
  Future delete(String id) async {
    Database? db = await _sqliteHelper.database;

    return await db!.delete(SQLiteNames.accountTable,
        where: "${SQLiteNames.id} = ?", whereArgs: [id]);
  }
}
