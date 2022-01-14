// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'account_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AccountType _$$_AccountTypeFromJson(Map<String, dynamic> json) =>
    _$_AccountType(
      id: json['id'] as String,
      uid: json['uid'] as String? ?? "GROWTH",
      name: json['name'] as String,
      iconPoint: json['iconPoint'] as int,
      iconFamily: json['iconFamily'] as String,
    );

Map<String, dynamic> _$$_AccountTypeToJson(_$_AccountType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'name': instance.name,
      'iconPoint': instance.iconPoint,
      'iconFamily': instance.iconFamily,
    };
