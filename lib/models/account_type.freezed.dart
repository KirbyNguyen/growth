// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'account_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AccountType _$AccountTypeFromJson(Map<String, dynamic> json) {
  return _AccountType.fromJson(json);
}

/// @nodoc
class _$AccountTypeTearOff {
  const _$AccountTypeTearOff();

  _AccountType call(
      {required String id,
      String uid = "GROWTH",
      required String name,
      required int iconPoint,
      required String iconFamily}) {
    return _AccountType(
      id: id,
      uid: uid,
      name: name,
      iconPoint: iconPoint,
      iconFamily: iconFamily,
    );
  }

  AccountType fromJson(Map<String, Object?> json) {
    return AccountType.fromJson(json);
  }
}

/// @nodoc
const $AccountType = _$AccountTypeTearOff();

/// @nodoc
mixin _$AccountType {
  String get id => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get iconPoint => throw _privateConstructorUsedError;
  String get iconFamily => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountTypeCopyWith<AccountType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountTypeCopyWith<$Res> {
  factory $AccountTypeCopyWith(
          AccountType value, $Res Function(AccountType) then) =
      _$AccountTypeCopyWithImpl<$Res>;
  $Res call(
      {String id, String uid, String name, int iconPoint, String iconFamily});
}

/// @nodoc
class _$AccountTypeCopyWithImpl<$Res> implements $AccountTypeCopyWith<$Res> {
  _$AccountTypeCopyWithImpl(this._value, this._then);

  final AccountType _value;
  // ignore: unused_field
  final $Res Function(AccountType) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? uid = freezed,
    Object? name = freezed,
    Object? iconPoint = freezed,
    Object? iconFamily = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      iconPoint: iconPoint == freezed
          ? _value.iconPoint
          : iconPoint // ignore: cast_nullable_to_non_nullable
              as int,
      iconFamily: iconFamily == freezed
          ? _value.iconFamily
          : iconFamily // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$AccountTypeCopyWith<$Res>
    implements $AccountTypeCopyWith<$Res> {
  factory _$AccountTypeCopyWith(
          _AccountType value, $Res Function(_AccountType) then) =
      __$AccountTypeCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id, String uid, String name, int iconPoint, String iconFamily});
}

/// @nodoc
class __$AccountTypeCopyWithImpl<$Res> extends _$AccountTypeCopyWithImpl<$Res>
    implements _$AccountTypeCopyWith<$Res> {
  __$AccountTypeCopyWithImpl(
      _AccountType _value, $Res Function(_AccountType) _then)
      : super(_value, (v) => _then(v as _AccountType));

  @override
  _AccountType get _value => super._value as _AccountType;

  @override
  $Res call({
    Object? id = freezed,
    Object? uid = freezed,
    Object? name = freezed,
    Object? iconPoint = freezed,
    Object? iconFamily = freezed,
  }) {
    return _then(_AccountType(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      iconPoint: iconPoint == freezed
          ? _value.iconPoint
          : iconPoint // ignore: cast_nullable_to_non_nullable
              as int,
      iconFamily: iconFamily == freezed
          ? _value.iconFamily
          : iconFamily // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AccountType extends _AccountType {
  const _$_AccountType(
      {required this.id,
      this.uid = "GROWTH",
      required this.name,
      required this.iconPoint,
      required this.iconFamily})
      : super._();

  factory _$_AccountType.fromJson(Map<String, dynamic> json) =>
      _$$_AccountTypeFromJson(json);

  @override
  final String id;
  @JsonKey()
  @override
  final String uid;
  @override
  final String name;
  @override
  final int iconPoint;
  @override
  final String iconFamily;

  @override
  String toString() {
    return 'AccountType(id: $id, uid: $uid, name: $name, iconPoint: $iconPoint, iconFamily: $iconFamily)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AccountType &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.iconPoint, iconPoint) &&
            const DeepCollectionEquality()
                .equals(other.iconFamily, iconFamily));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(iconPoint),
      const DeepCollectionEquality().hash(iconFamily));

  @JsonKey(ignore: true)
  @override
  _$AccountTypeCopyWith<_AccountType> get copyWith =>
      __$AccountTypeCopyWithImpl<_AccountType>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AccountTypeToJson(this);
  }
}

abstract class _AccountType extends AccountType {
  const factory _AccountType(
      {required String id,
      String uid,
      required String name,
      required int iconPoint,
      required String iconFamily}) = _$_AccountType;
  const _AccountType._() : super._();

  factory _AccountType.fromJson(Map<String, dynamic> json) =
      _$_AccountType.fromJson;

  @override
  String get id;
  @override
  String get uid;
  @override
  String get name;
  @override
  int get iconPoint;
  @override
  String get iconFamily;
  @override
  @JsonKey(ignore: true)
  _$AccountTypeCopyWith<_AccountType> get copyWith =>
      throw _privateConstructorUsedError;
}
