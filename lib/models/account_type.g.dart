// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// ignore: non_constant_identifier_names
_$_AccountType _$$_AccountTypeFromJson(Map<String, dynamic> json) =>
    _$_AccountType(
      id: json['id'] as String,
      uid: json['uid'] as String? ?? "GROWTH",
      name: json['name'] as String,
      iconPoint: json['iconPoint'] as int,
      iconFamily: json['iconFamily'] as String,
    );

// ignore: non_constant_identifier_names
Map<String, dynamic> _$$_AccountTypeToJson(_$_AccountType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'name': instance.name,
      'iconPoint': instance.iconPoint,
      'iconFamily': instance.iconFamily,
    };
