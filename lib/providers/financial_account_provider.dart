import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:growth/providers/database_provider.dart';

import 'package:growth/databases/sql_database.dart';
import 'package:growth/models/financial_account.dart';

final accountProvider =
    StateNotifierProvider<AccountRepository, List<FinancialAccount>>(
  (ref) {
    return AccountRepository(
      [],
      ref.watch(sqliteProvider).value,
    );
  },
);

/// [AccountRepository] provides a state for a list of [FinancialAccount]
class AccountRepository extends StateNotifier<List<FinancialAccount>> {
  SQLiteDatabase? sqliteDatabase;

  AccountRepository(List<FinancialAccount> state, this.sqliteDatabase)
      : super(state);

  Future<void> initialize(String uid) async {
    List<FinancialAccount> list = await sqliteDatabase!.getAllAccounts(uid);
    state = [
      for (final item in list)
        if (item.uid == uid) item,
    ];
  }

  Future<void> add(FinancialAccount account) async {
    await sqliteDatabase!.insertAccount(account);
    state.add(account);
  }

  Future<void> update(FinancialAccount account) async {
    await sqliteDatabase!.updateAccount(account);
    int index = state.indexWhere((element) => element.id == account.id);
    state[index] = account;
  }

  Future<void> delete(String id) async {
    await sqliteDatabase!.deleteAccount(id);
    state.removeWhere((element) => element.id == id);
  }
}
