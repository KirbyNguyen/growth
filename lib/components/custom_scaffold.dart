import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:growth/constants/custom_colors.dart';
import 'package:growth/providers/theme_provider.dart';

class CustomScaffold extends HookConsumerWidget {
  const CustomScaffold._({
    Key? key,
    required this.title,
    required this.actions,
    required this.sliverChildDelegate,
    this.floatingActionButton,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  }) : super(key: key);

  factory CustomScaffold({
    Key? key,
    required String title,
    required List<Widget> actions,
    required List<Widget> children,
    FloatingActionButton? floatingActionButton,
    EdgeInsets padding =
        const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  }) =>
      CustomScaffold._(
          key: key,
          title: title,
          actions: actions,
          padding: padding,
          floatingActionButton: floatingActionButton,
          sliverChildDelegate: SliverChildListDelegate(children));

  factory CustomScaffold.builder({
    Key? key,
    required String title,
    required int childCount,
    required List<Widget> actions,
    required IndexedWidgetBuilder builder,
    FloatingActionButton? floatingActionButton,
    EdgeInsets padding =
        const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  }) =>
      CustomScaffold._(
          key: key,
          title: title,
          actions: actions,
          padding: padding,
          floatingActionButton: floatingActionButton,
          sliverChildDelegate:
              SliverChildBuilderDelegate(builder, childCount: childCount));

  final String title;
  final EdgeInsets padding;
  final List<Widget> actions;
  final FloatingActionButton? floatingActionButton;
  final SliverChildDelegate sliverChildDelegate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkModeEnabled = ref.read(appThemeStateProvider);

    return Scaffold(
      floatingActionButton: floatingActionButton,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            elevation: 1,
            backgroundColor: darkModeEnabled
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
