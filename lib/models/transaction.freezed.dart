// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Transaction _$TransactionFromJson(Map<String, dynamic> json) {
  return _Transaction.fromJson(json);
}

/// @nodoc
class _$TransactionTearOff {
  const _$TransactionTearOff();

  _Transaction call(
      {required String id,
      required String uid,
      required String typeID,
      required String accountID,
      required String note,
      required String name,
      required String method,
      required DateTime date,
      required DateTime dateCreated,
      required DateTime dateEdited}) {
    return _Transaction(
      id: id,
      uid: uid,
      typeID: typeID,
      accountID: accountID,
      note: note,
      name: name,
      method: method,
      date: date,
      dateCreated: dateCreated,
      dateEdited: dateEdited,
    );
  }

  Transaction fromJson(Map<String, Object?> json) {
    return Transaction.fromJson(json);
  }
}

/// @nodoc
const $Transaction = _$TransactionTearOff();

/// @nodoc
mixin _$Transaction {
  String get id => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  String get typeID => throw _privateConstructorUsedError;
  String get accountID => throw _privateConstructorUsedError;
  String get note => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get method => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  DateTime get dateCreated => throw _privateConstructorUsedError;
  DateTime get dateEdited => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionCopyWith<Transaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionCopyWith<$Res> {
  factory $TransactionCopyWith(
          Transaction value, $Res Function(Transaction) then) =
      _$TransactionCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String uid,
      String typeID,
      String accountID,
      String note,
      String name,
      String method,
      DateTime date,
      DateTime dateCreated,
      DateTime dateEdited});
}

/// @nodoc
class _$TransactionCopyWithImpl<$Res> implements $TransactionCopyWith<$Res> {
  _$TransactionCopyWithImpl(this._value, this._then);

  final Transaction _value;
  // ignore: unused_field
  final $Res Function(Transaction) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? uid = freezed,
    Object? typeID = freezed,
    Object? accountID = freezed,
    Object? note = freezed,
    Object? name = freezed,
    Object? method = freezed,
    Object? date = freezed,
    Object? dateCreated = freezed,
    Object? dateEdited = freezed,
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
      typeID: typeID == freezed
          ? _value.typeID
          : typeID // ignore: cast_nullable_to_non_nullable
              as String,
      accountID: accountID == freezed
          ? _value.accountID
          : accountID // ignore: cast_nullable_to_non_nullable
              as String,
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      method: method == freezed
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateCreated: dateCreated == freezed
          ? _value.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateEdited: dateEdited == freezed
          ? _value.dateEdited
          : dateEdited // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$TransactionCopyWith<$Res>
    implements $TransactionCopyWith<$Res> {
  factory _$TransactionCopyWith(
          _Transaction value, $Res Function(_Transaction) then) =
      __$TransactionCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String uid,
      String typeID,
      String accountID,
      String note,
      String name,
      String method,
      DateTime date,
      DateTime dateCreated,
      DateTime dateEdited});
}

/// @nodoc
class __$TransactionCopyWithImpl<$Res> extends _$TransactionCopyWithImpl<$Res>
    implements _$TransactionCopyWith<$Res> {
  __$TransactionCopyWithImpl(
      _Transaction _value, $Res Function(_Transaction) _then)
      : super(_value, (v) => _then(v as _Transaction));

  @override
  _Transaction get _value => super._value as _Transaction;

  @override
  $Res call({
    Object? id = freezed,
    Object? uid = freezed,
    Object? typeID = freezed,
    Object? accountID = freezed,
    Object? note = freezed,
    Object? name = freezed,
    Object? method = freezed,
    Object? date = freezed,
    Object? dateCreated = freezed,
    Object? dateEdited = freezed,
  }) {
    return _then(_Transaction(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      typeID: typeID == freezed
          ? _value.typeID
          : typeID // ignore: cast_nullable_to_non_nullable
              as String,
      accountID: accountID == freezed
          ? _value.accountID
          : accountID // ignore: cast_nullable_to_non_nullable
              as String,
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      method: method == freezed
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateCreated: dateCreated == freezed
          ? _value.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateEdited: dateEdited == freezed
          ? _value.dateEdited
          : dateEdited // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Transaction extends _Transaction {
  const _$_Transaction(
      {required this.id,
      required this.uid,
      required this.typeID,
      required this.accountID,
      required this.note,
      required this.name,
      required this.method,
      required this.date,
      required this.dateCreated,
      required this.dateEdited})
      : super._();

  factory _$_Transaction.fromJson(Map<String, dynamic> json) =>
      _$$_TransactionFromJson(json);

  @override
  final String id;
  @override
  final String uid;
  @override
  final String typeID;
  @override
  final String accountID;
  @override
  final String note;
  @override
  final String name;
  @override
  final String method;
  @override
  final DateTime date;
  @override
  final DateTime dateCreated;
  @override
  final DateTime dateEdited;

  @override
  String toString() {
    return 'Transaction(id: $id, uid: $uid, typeID: $typeID, accountID: $accountID, note: $note, name: $name, method: $method, date: $date, dateCreated: $dateCreated, dateEdited: $dateEdited)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Transaction &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality().equals(other.typeID, typeID) &&
            const DeepCollectionEquality().equals(other.accountID, accountID) &&
            const DeepCollectionEquality().equals(other.note, note) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.method, method) &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality()
                .equals(other.dateCreated, dateCreated) &&
            const DeepCollectionEquality()
                .equals(other.dateEdited, dateEdited));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(typeID),
      const DeepCollectionEquality().hash(accountID),
      const DeepCollectionEquality().hash(note),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(method),
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(dateCreated),
      const DeepCollectionEquality().hash(dateEdited));

  @JsonKey(ignore: true)
  @override
  _$TransactionCopyWith<_Transaction> get copyWith =>
      __$TransactionCopyWithImpl<_Transaction>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionToJson(this);
  }
}

abstract class _Transaction extends Transaction {
  const factory _Transaction(
      {required String id,
      required String uid,
      required String typeID,
      required String accountID,
      required String note,
      required String name,
      required String method,
      required DateTime date,
      required DateTime dateCreated,
      required DateTime dateEdited}) = _$_Transaction;
  const _Transaction._() : super._();

  factory _Transaction.fromJson(Map<String, dynamic> json) =
      _$_Transaction.fromJson;

  @override
  String get id;
  @override
  String get uid;
  @override
  String get typeID;
  @override
  String get accountID;
  @override
  String get note;
  @override
  String get name;
  @override
  String get method;
  @override
  DateTime get date;
  @override
  DateTime get dateCreated;
  @override
  DateTime get dateEdited;
  @override
  @JsonKey(ignore: true)
  _$TransactionCopyWith<_Transaction> get copyWith =>
      throw _privateConstructorUsedError;
}
