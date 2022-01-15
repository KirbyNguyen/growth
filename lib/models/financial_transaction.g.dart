// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'financial_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// ignore: non_constant_identifier_names
_$_FinancialTransaction _$$_FinancialTransactionFromJson(
        Map<String, dynamic> json) =>
    _$_FinancialTransaction(
      id: json['id'] as String,
      uid: json['uid'] as String,
      accountID: json['accountID'] as String,
      note: json['note'] as String,
      expense: json['expense'] as bool,
      method: json['method'] as String,
      amount: (json['amount'] as num).toDouble(),
      date: DateTime.parse(json['date'] as String),
      dateCreated: DateTime.parse(json['dateCreated'] as String),
      dateEdited: DateTime.parse(json['dateEdited'] as String),
    );

// ignore: non_constant_identifier_names
Map<String, dynamic> _$$_FinancialTransactionToJson(
        _$_FinancialTransaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'accountID': instance.accountID,
      'note': instance.note,
      'expense': instance.expense,
      'method': instance.method,
      'amount': instance.amount,
      'date': instance.date.toIso8601String(),
      'dateCreated': instance.dateCreated.toIso8601String(),
      'dateEdited': instance.dateEdited.toIso8601String(),
    };
