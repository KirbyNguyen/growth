import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:growth/constants/bottom_item_list.dart';
import 'package:growth/constants/custom_colors.dart';

import 'package:growth/models/bottom_tab_item.dart';
import 'package:growth/providers/app_theme_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _currentTabIndex = useState(0);
    final _currentTab =
        useMemoized(() => bottomTabList[_currentTabIndex.value]);

    final _useAppThemeStateProvider = useProvider(appThemeStateProvider);

    Widget _buildPage(BottomTabItem tabItem) => Navigator(
          key: tabItem.navigatorKey,
          onGenerateRoute: (settings) => MaterialPageRoute(
            settings: settings,
            builder: (context) => tabItem.page,
          ),
        );
    // Widget _buildPage(BottomTabItem tabItem) => tabItem.page;

    void _selectTab(int newIndex) {
      if (_currentTabIndex.value != newIndex) {
        _currentTabIndex.value = newIndex;
      } else {
        _currentTab.navigatorKey.currentState!
            .popUntil((route) => route.isFirst);
      }
    }

    return WillPopScope(
      onWillPop: () async =>
          !await _currentTab.navigatorKey.currentState!.maybePop(),
      child: Scaffold(
        body: IndexedStack(
          index: _currentTabIndex.value,
          children: bottomTabList.map(_buildPage).toList(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentTabIndex.value,
          onTap: _selectTab,
          items: bottomTabList
              .map(
                (item) => BottomNavigationBarItem(
                  label: item.pageName,
                  icon: Icon(item.iconData),
                  backgroundColor: _useAppThemeStateProvider
                      ? CustomColors.primaryDark
                      : CustomColors.primaryLight,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
