enum TransactionType {
  expense,
  income,
  transfer,
}

/// [SQLiteNames] holds constant names for SQLite table as a [String]
class SQLiteNames {
  static const String accountTable = "ACCOUNT_TABLE";
  static const String accountTypeTable = "ACCOUNT_TYPE_TABLE";
  static const String transactionTable = "TRANSACTION_TABLE";

  static const String id = "id";
  static const String userId = "userId";
  static const String name = "name";
  static const String iconPoint = "iconPoint";
  static const String iconFamily = "iconFamily";

  static const String balance = "balance";
  static const String colorValue = "colorValue";
  static const String currencyCode = "currencyCode";
  static const String currencyFlag = "currencyFlag";
  static const String accountTypeId = "accountTypeId";
}
