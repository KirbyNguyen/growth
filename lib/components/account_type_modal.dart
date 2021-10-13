import 'package:flutter/material.dart';
import 'package:growth/models/account_type.dart';

/// [AccountTypeModal] provides a way to show a modal with [AccountType].
class AccountTypeModal {
  final List<AccountType> _existingTypeList = [
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

  List<AccountType> typeList = [];

  /// Takes in a [BuildContext] to build a bottom modal for [AccountType].
  Future<dynamic> showModal(BuildContext context) {
    typeList = _existingTypeList;

    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView.builder(
          itemCount: typeList.length,
          itemBuilder: (context, index) {
            final AccountType item = typeList[index];

            return GestureDetector(
              onTap: () => Navigator.of(context).pop(item),
              child: ListTile(
                title: Text(item.name),
                leading:
                    Icon(IconData(item.iconPoint, fontFamily: item.iconFamily)),
              ),
            );
          },
        );
      },
    );
  }
}
