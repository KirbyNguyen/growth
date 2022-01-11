import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';

part 'bottom_tab_item.freezed.dart';

@freezed
class BottomTabItem with _$BottomTabItem {
  factory BottomTabItem({
    required String pageName,
    required IconData iconData,
    required Navigator navigator,
    required GlobalKey<NavigatorState> navigatorKey,
  }) = _BottomTabItem;
}
