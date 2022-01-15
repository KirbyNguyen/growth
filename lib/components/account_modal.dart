import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:growth/models/account_type.dart';
import 'package:growth/models/financial_account.dart';

import 'package:growth/constants/existing_type_list.dart';
import 'package:growth/providers/financial_account_provider.dart';

/// [AccountModal] provides a way to show a modal with [FinancialAccount]
class AccountModal {
  List<AccountType> typeList = [];

  Future<dynamic> showModal(BuildContext context, WidgetRef ref) {
    typeList = ExistingTypeList.list;
    final accountList = ref.watch(accountProvider);

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
          itemCount: accountList.length,
          itemBuilder: (context, index) {
            final FinancialAccount item = accountList[index];
            final AccountType type =
                typeList.firstWhere((element) => element.id == item.typeID);

            return GestureDetector(
              onTap: () => Navigator.of(context).pop(item),
              child: ListTile(
                title: Text(
                  item.name,
                  style: TextStyle(
                    color: Color(item.colorValue),
                  ),
                ),
                leading: Icon(
                  IconData(type.iconPoint, fontFamily: type.iconFamily),
                  color: Color(item.colorValue),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
