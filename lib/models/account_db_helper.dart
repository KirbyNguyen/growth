import 'package:growth/models/balance_account.dart';

abstract class AccountDBHelper {
  Future<List<BalanceAccount>> getAll(String userId);
  Future<BalanceAccount> getOne(String id);
  Future insert(BalanceAccount account);
  Future update(BalanceAccount account);
  Future delete(String id);
}
