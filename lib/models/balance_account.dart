import 'package:uuid/uuid.dart';

class BalanceAccount {
  final Uuid uuid = const Uuid();
  
  late String _id;
  late String _userId;
  late String _accountTypeId;
  late String currencyFlag;
  late String currencyCode;
  late String name;
  late double balance;
  late int colorValue;

  BalanceAccount({
    String? id,
    required String userId,
    required String accountTypeId,
    required this.name,
    required this.balance,
    required this.currencyFlag,
    required this.currencyCode,
    required this.colorValue,
  }) {
    _id = id ?? uuid.v4();
    _userId = userId;
    _accountTypeId = accountTypeId;
  }

  String get id => _id;
  String get userId => _userId;
  String get accountTypeId => _accountTypeId;
}
