import 'package:flutter/material.dart';

import 'package:growth/models/account_type.dart';
import 'package:growth/constants/existing_type_list.dart';

/// [AccountTypeModal] provides a way to show a modal with [AccountType]
class AccountTypeModal {
  List<AccountType> typeList = [];

  Future<dynamic> showModal(BuildContext context) {
    typeList = ExistingTypeList.list;

    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
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
