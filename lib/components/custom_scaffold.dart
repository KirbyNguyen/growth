import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:growth/constants/custom_colors.dart';
import 'package:growth/providers/app_theme_provider.dart';

class CustomScaffold extends HookWidget {
  const CustomScaffold._({
    Key? key,
    required this.title,
    required this.sliverChildDelegate,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    required this.actions,
  }) : super(key: key);

  factory CustomScaffold({
    Key? key,
    required String title,
    required List<Widget> actions,
    required List<Widget> children,
    EdgeInsets padding =
        const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  }) =>
      CustomScaffold._(
          key: key,
          title: title,
          actions: actions,
          padding: padding,
          sliverChildDelegate: SliverChildListDelegate(children));

  factory CustomScaffold.builder({
    Key? key,
    required String title,
    required IndexedWidgetBuilder builder,
    required int childCount,
    required List<Widget> actions,
    EdgeInsets padding =
        const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  }) =>
      CustomScaffold._(
          key: key,
          title: title,
          actions: actions,
          padding: padding,
          sliverChildDelegate:
              SliverChildBuilderDelegate(builder, childCount: childCount));

  final String title;

  final List<Widget> actions;

  final EdgeInsets padding;

  final SliverChildDelegate sliverChildDelegate;

  @override
  Widget build(BuildContext context) {
    final _useAppThemeState = useProvider(appThemeStateProvider);

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            elevation: 1,
            backgroundColor: _useAppThemeState
                ? CustomColors.primaryDark
                : CustomColors.primaryLight,
            actions: actions,
            title: Text(title, style: Theme.of(context).textTheme.headline6),
          ),
          SliverPadding(
            padding: padding,
            sliver: SliverList(delegate: sliverChildDelegate),
          )
        ],
      ),
    );
  }
}
