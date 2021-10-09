import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AccountInfoPage extends HookWidget {
  AccountInfoPage({Key? key, required title}) : super(key: key) {
    _title = title;
  }

  late final String _title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
    );
  }
}
