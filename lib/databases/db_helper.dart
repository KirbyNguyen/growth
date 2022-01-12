import 'package:growth/models/financial_account.dart';

abstract class DBHelper {
  Future<List<FinancialAccount>> getAllAccounts(String uid);
  Future<FinancialAccount> getOneAccount(String id);
  Future insertAccount(FinancialAccount account);
  Future updateAccount(FinancialAccount account);
  Future deleteAccount(String id);
}
