import 'package:growth/databases/account_sqlite_database.dart';
import 'package:growth/models/balance_account.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Uses [riverpod] to provide [AccountRepository].
final accountProvider =
    StateNotifierProvider<AccountRepository, List<BalanceAccount>>(
  (ref) {
    return AccountRepository(
      [],
      ref.watch(sqliteProvider),
    );
  },
);

/// [AccountRepository] provides a state for a list of [BalanceAccount].
class AccountRepository extends StateNotifier<List<BalanceAccount>> {
  AccountSQLiteDB accountSQLite;
  AccountRepository(List<BalanceAccount> state, AccountSQLiteDB accountDB)
      : accountSQLite = accountDB,
        super(state);

  /// Takes [String] as a userId to retrieve the list from the database, and
  /// sets it as a state
  Future getList(String userId) async {
    List<BalanceAccount> list = await accountSQLite.getAll(userId);
    state = [
      for (final item in list)
        if (item.userId == userId) item,
    ];
  }

  /// Takes [BalanceAccount], adds it to the database, then in the state.
  Future insert(BalanceAccount account) async {
    await accountSQLite.insert(account);
    state = [...state, account];
  }

  /// Takes [BalanceAccount], updates it to the database, then in the state.
  Future update(BalanceAccount account) async {
    await accountSQLite.update(account);
    state = [
      for (final item in state)
        if (item.id == account.id)
          BalanceAccount(
            id: item.id,
            userId: item.userId,
            accountTypeId: account.accountTypeId,
            name: account.name,
            balance: account.balance,
            currencyFlag: account.currencyFlag,
            currencyCode: account.currencyCode,
            colorValue: account.colorValue,
          )
        else
          item,
    ];
  }

  /// Takes [String] as an id, deletes it from the database, and excludes it
  /// from the new state.
  Future delete(String id) async {
    await accountSQLite.delete(id);
    state = state.where((item) => item.id != id).toList();
  }
}
