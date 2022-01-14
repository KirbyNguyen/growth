// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// ignore: non_constant_identifier_names
_$_Transaction _$$_TransactionFromJson(Map<String, dynamic> json) =>
    _$_Transaction(
      id: json['id'] as String,
      uid: json['uid'] as String,
      typeID: json['typeID'] as String,
      accountID: json['accountID'] as String,
      note: json['note'] as String,
      name: json['name'] as String,
      method: json['method'] as String,
      date: DateTime.parse(json['date'] as String),
      dateCreated: DateTime.parse(json['dateCreated'] as String),
      dateEdited: DateTime.parse(json['dateEdited'] as String),
    );

// ignore: non_constant_identifier_names
Map<String, dynamic> _$$_TransactionToJson(_$_Transaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'typeID': instance.typeID,
      'accountID': instance.accountID,
      'note': instance.note,
      'name': instance.name,
      'method': instance.method,
      'date': instance.date.toIso8601String(),
      'dateCreated': instance.dateCreated.toIso8601String(),
      'dateEdited': instance.dateEdited.toIso8601String(),
    };
