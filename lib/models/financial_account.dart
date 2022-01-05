import 'package:growth/constants/database_names.dart';
import 'package:uuid/uuid.dart';

class FinancialAccount {
  late final String _id;
  late final String _uid;

  late String typeID;
  late String name;
  late double balance;
  late int colorValue;
  late String currencyCode;

  FinancialAccount({
    String? id,
    required String uid,
    required this.typeID,
    required this.name,
    required this.balance,
    required this.colorValue,
    required this.currencyCode,
  }) {
    _id = id ?? const Uuid().v4();
    _uid = uid;
  }

  String get id => _id;
  String get uid => _uid;

  FinancialAccount.fromJson(Map<String, dynamic> json) {
    _id = json[DatabaseNames.id] as String;
    _uid = json[DatabaseNames.uid] as String;
    name = json[DatabaseNames.name] as String;
    typeID = json[DatabaseNames.typeID] as String;
    colorValue = json[DatabaseNames.colorValue] as int;
    balance = (json[DatabaseNames.balance] as num).toDouble();
    currencyCode = json[DatabaseNames.currencyCode] as String;
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        DatabaseNames.id: _id,
        DatabaseNames.uid: _uid,
        DatabaseNames.name: name,
        DatabaseNames.typeID: typeID,
        DatabaseNames.balance: balance,
        DatabaseNames.colorValue: colorValue,
        DatabaseNames.currencyCode: currencyCode,
      };
}
