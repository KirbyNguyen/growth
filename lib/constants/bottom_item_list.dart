import 'package:flutter/material.dart';
import 'package:growth/models/bottom_tab_item.dart';

import 'package:growth/pages/balance/balance_home_page.dart';
import 'package:growth/pages/garden/garden_home_page.dart';
import 'package:growth/pages/settings/settings_home_page.dart';

List<BottomTabItem> bottomTabList = [
  BottomTabItem(
    pageName: "Balance",
    iconData: Icons.account_balance,
    page: const BalanceHomePage(),
  ),
  BottomTabItem(
    pageName: "Garden",
    iconData: Icons.spa,
    page: const GardenHomePage(),
  ),
  BottomTabItem(
    pageName: "Settings",
    iconData: Icons.settings,
    page: const SettingsHomePage(),
  ),
];
