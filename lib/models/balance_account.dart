import 'package:growth/constants/sqlite_names.dart';
import 'package:uuid/uuid.dart';

class BalanceAccount {
  final Uuid uuid = const Uuid();

  late String _id;
  late String _userId;
  late String accountTypeId;
  late String currencyFlag;
  late String currencyCode;
  late String name;
  late double balance;
  late int colorValue;

  BalanceAccount({
    String? id,
    required String userId,
    required this.accountTypeId,
    required this.name,
    required this.balance,
    required this.currencyFlag,
    required this.currencyCode,
    required this.colorValue,
  }) {
    _id = id ?? uuid.v4();
    _userId = userId;
  }

  String get id => _id;
  String get userId => _userId;

  /// Translate the account type into a map.
  /// Return a [Map] with <String, dynamic>.
  Map<String, dynamic> toMap() {
    Map<String, dynamic> tempMap = <String, dynamic>{
      SQLiteNames.id: _id,
      SQLiteNames.userId: userId,
      SQLiteNames.accountTypeId: accountTypeId,
      SQLiteNames.name: name,
      SQLiteNames.balance: balance,
      SQLiteNames.colorValue: colorValue,
    };
    return tempMap;
  }

  /// Decode a map into an account type.
  /// Take in a [Map] with <String, dynamic>.
  BalanceAccount.fromMap(Map<dynamic, dynamic> map) {
    _id = map[SQLiteNames.id];
    _userId = map[SQLiteNames.userId];
    accountTypeId = map[SQLiteNames.accountTypeId];
    name = map[SQLiteNames.name];
    balance = map[SQLiteNames.balance];
    colorValue = map[SQLiteNames.colorValue];
    currencyFlag = map[SQLiteNames.currencyFlag];
    currencyCode = map[SQLiteNames.currencyCode];
  }

  /// Create an account type from a map.
  /// Take in a [Map] with <String, dynamic>.
  /// Return an [BalanceAccount].
  BalanceAccount fromValue(Map<dynamic, dynamic> map) {
    BalanceAccount accountType = BalanceAccount(
      id: map[SQLiteNames.id],
      userId: map[SQLiteNames.userId],
      accountTypeId: map[SQLiteNames.accountTypeId],
      name: map[SQLiteNames.name],
      balance: map[SQLiteNames.balance],
      colorValue: map[SQLiteNames.colorValue],
      currencyFlag: map[SQLiteNames.currencyFlag],
      currencyCode: map[SQLiteNames.currencyCode],
    );

    return accountType;
  }
}
