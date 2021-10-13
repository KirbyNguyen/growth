import 'package:growth/models/account_type.dart';

class ExistingTypeList {
  static List<AccountType> list = [
    AccountType(
      name: "General",
      iconPoint: 57409,
      iconFamily: AccountType.materialFamily,
    ),
    AccountType(
      name: "Cash",
      iconPoint: 58359,
      iconFamily: AccountType.materialFamily,
    ),
    AccountType(
      name: "Checking",
      iconPoint: 57408,
      iconFamily: AccountType.materialFamily,
    ),
  ];
}
