import 'package:growth/models/financial_account.dart';
import 'package:growth/models/financial_transaction.dart';

abstract class DBHelper {
  Future<List<FinancialAccount>> getAllAccounts(String uid);
  Future<FinancialAccount> getOneAccount(String id);
  Future insertAccount(FinancialAccount account);
  Future updateAccount(FinancialAccount account);
  Future deleteAccount(String id);

  Future<List<FinancialTransaction>> getAllTransactions(String uid);
  Future<FinancialTransaction> getOneTransaction(String id);
  Future insertTransaction(FinancialTransaction transaction);
  Future updateTransaction(FinancialTransaction transaction);
  Future deleteTransaction(String id);
}
