import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:growth/providers/database_provider.dart';

import 'package:growth/databases/sql_database.dart';
import 'package:growth/models/financial_transaction.dart';

final transactionProvider =
    StateNotifierProvider<FinancialRepository, List<FinancialTransaction>>(
  (ref) {
    return FinancialRepository(
      [],
      ref.watch(sqliteProvider).value,
    );
  },
);

/// [FinancialRepository] provides a state for a list of [FinancialTransaction]
class FinancialRepository extends StateNotifier<List<FinancialTransaction>> {
  SQLiteDatabase? sqliteDatabase;

  FinancialRepository(List<FinancialTransaction> state, this.sqliteDatabase)
      : super(state);

  Future<void> initialize(String uid) async {
    List<FinancialTransaction> list =
        await sqliteDatabase!.getAllTransactions(uid);
    state = [
      for (final item in list)
        if (item.uid == uid) item,
    ];
  }

  Future<void> add(FinancialTransaction transaction) async {
    await sqliteDatabase!.insertTransaction(transaction);
    state.add(transaction);
  }

  Future<void> update(FinancialTransaction transaction) async {
    await sqliteDatabase!.updateTransaction(transaction);
    int index = state.indexWhere((element) => element.id == transaction.id);
    state[index] = transaction;
  }

  Future<void> delete(String id) async {
    await sqliteDatabase!.deleteTransaction(id);
    state.removeWhere((element) => element.id == id);
  }
}
