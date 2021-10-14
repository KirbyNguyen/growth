import 'package:growth/models/account_type.dart';

class ExistingTypeList {
  static List<AccountType> list = [
    AccountType(
      id: "GENERIC_GENERAL",
      name: "General",
      iconPoint: 57409,
      iconFamily: AccountType.materialFamily,
    ),
    AccountType(
      id: "GENERIC_CASH",
      name: "Cash",
      iconPoint: 58359,
      iconFamily: AccountType.materialFamily,
    ),
    AccountType(
      id: "GENERIC_CHECKING",
      name: "Checking",
      iconPoint: 57408,
      iconFamily: AccountType.materialFamily,
    ),
  ];
}
