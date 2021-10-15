class BalanceAccount {
  late String _id;
  late String _userId;
  late String _accountTypeId;
  late String currencyFlag;
  late String currencyCode;
  late String name;
  late double balance;
  late int colorValue;

  BalanceAccount({
    required String id,
    required String userId,
    required String accountTypeId,
    required this.name,
    required this.balance,
    required this.currencyFlag,
    required this.currencyCode,
    required this.colorValue,
  }) {
    _id = id;
    _userId = userId;
    _accountTypeId = accountTypeId;
  }

  String get id => _id;
  String get userId => _userId;
  String get accountTypeId => _accountTypeId;
}
