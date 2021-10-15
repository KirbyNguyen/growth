import 'package:growth/models/account_type.dart';

class ExistingTypeList {
  static List<AccountType> list = [
    AccountType(
      id: "GENERAL",
      name: "General",
      iconPoint: 57409,
      iconFamily: AccountType.materialFamily,
    ),
    AccountType(
      id: "CASH",
      name: "Cash",
      iconPoint: 58359,
      iconFamily: AccountType.materialFamily,
    ),
    AccountType(
      id: "CHECKING",
      name: "Checking",
      iconPoint: 57408,
      iconFamily: AccountType.materialFamily,
    ),
    AccountType(
      id: "SAVING",
      name: "Saving",
      iconPoint: 58707,
      iconFamily: AccountType.materialFamily,
    ),
  ];
}
