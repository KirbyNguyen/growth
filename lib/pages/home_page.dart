import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:growth/providers/theme_provider.dart';

import 'package:growth/constants/custom_colors.dart';
import 'package:growth/constants/bottom_item_list.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTabIndex = useState(0);
    final bottomTabList = useMemoized(() => BottomItemList().list());
    final currentTab = useMemoized(() => bottomTabList[currentTabIndex.value]);

    final darkModeEnabled = ref.watch(appThemeStateProvider);

    void _selectTab(int newIndex) {
      if (currentTabIndex.value != newIndex) {
        currentTabIndex.value = newIndex;
      } else {
        currentTab.navigatorKey.currentState!
            .popUntil((route) => route.isFirst);
      }
    }

    return WillPopScope(
      onWillPop: () async =>
          !await currentTab.navigatorKey.currentState!.maybePop(),
      child: Scaffold(
        body: IndexedStack(
          index: currentTabIndex.value,
          children: bottomTabList.map((item) => item.navigator).toList(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentTabIndex.value,
          onTap: _selectTab,
          items: bottomTabList
              .map(
                (item) => BottomNavigationBarItem(
                  label: item.pageName,
                  icon: Icon(item.iconData),
                  backgroundColor: darkModeEnabled
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
