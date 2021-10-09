import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:growth/constants/bottom_item_list.dart';
import 'package:growth/constants/custom_colors.dart';

import 'package:growth/providers/app_theme_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _useCurrentTabIndex = useState(0);
    final _useBottomTabList = useMemoized(() => BottomItemList().list());
    final _useCurrentTab =
        useMemoized(() => _useBottomTabList[_useCurrentTabIndex.value]);

    final _useAppThemeState = useProvider(appThemeStateProvider);

    void _selectTab(int newIndex) {
      if (_useCurrentTabIndex.value != newIndex) {
        _useCurrentTabIndex.value = newIndex;
      } else {
        _useCurrentTab.navigatorKey.currentState!
            .popUntil((route) => route.isFirst);
      }
    }

    return WillPopScope(
      onWillPop: () async =>
          !await _useCurrentTab.navigatorKey.currentState!.maybePop(),
      child: Scaffold(
        body: IndexedStack(
          index: _useCurrentTabIndex.value,
          children: _useBottomTabList.map((item) => item.navigator).toList(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _useCurrentTabIndex.value,
          onTap: _selectTab,
          items: _useBottomTabList
              .map(
                (item) => BottomNavigationBarItem(
                  label: item.pageName,
                  icon: Icon(item.iconData),
                  backgroundColor: _useAppThemeState
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
