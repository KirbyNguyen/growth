// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'financial_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// ignore: non_constant_identifier_names
_$_FinancialAccount _$$_FinancialAccountFromJson(Map<String, dynamic> json) =>
    _$_FinancialAccount(
      id: json['id'] as String,
      uid: json['uid'] as String,
      typeID: json['typeID'] as String,
      name: json['name'] as String,
      balance: (json['balance'] as num).toDouble(),
      currencyCode: json['currencyCode'] as String,
      colorValue: json['colorValue'] as int,
    );

// ignore: non_constant_identifier_names
Map<String, dynamic> _$$_FinancialAccountToJson(_$_FinancialAccount instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'typeID': instance.typeID,
      'name': instance.name,
      'balance': instance.balance,
      'currencyCode': instance.currencyCode,
      'colorValue': instance.colorValue,
    };
