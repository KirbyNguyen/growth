// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'financial_transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FinancialTransaction _$FinancialTransactionFromJson(Map<String, dynamic> json) {
  return _FinancialTransaction.fromJson(json);
}

/// @nodoc
class _$FinancialTransactionTearOff {
  const _$FinancialTransactionTearOff();

  _FinancialTransaction call(
      {required String id,
      required String uid,
      required String accountID,
      required String note,
      required bool expense,
      required String method,
      required double amount,
      required DateTime date,
      required DateTime dateCreated,
      required DateTime dateEdited}) {
    return _FinancialTransaction(
      id: id,
      uid: uid,
      accountID: accountID,
      note: note,
      expense: expense,
      method: method,
      amount: amount,
      date: date,
      dateCreated: dateCreated,
      dateEdited: dateEdited,
    );
  }

  FinancialTransaction fromJson(Map<String, Object?> json) {
    return FinancialTransaction.fromJson(json);
  }
}

/// @nodoc
const $FinancialTransaction = _$FinancialTransactionTearOff();

/// @nodoc
mixin _$FinancialTransaction {
  String get id => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  String get accountID => throw _privateConstructorUsedError;
  String get note => throw _privateConstructorUsedError;
  bool get expense => throw _privateConstructorUsedError;
  String get method => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  DateTime get dateCreated => throw _privateConstructorUsedError;
  DateTime get dateEdited => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FinancialTransactionCopyWith<FinancialTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FinancialTransactionCopyWith<$Res> {
  factory $FinancialTransactionCopyWith(FinancialTransaction value,
          $Res Function(FinancialTransaction) then) =
      _$FinancialTransactionCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String uid,
      String accountID,
      String note,
      bool expense,
      String method,
      double amount,
      DateTime date,
      DateTime dateCreated,
      DateTime dateEdited});
}

/// @nodoc
class _$FinancialTransactionCopyWithImpl<$Res>
    implements $FinancialTransactionCopyWith<$Res> {
  _$FinancialTransactionCopyWithImpl(this._value, this._then);

  final FinancialTransaction _value;
  // ignore: unused_field
  final $Res Function(FinancialTransaction) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? uid = freezed,
    Object? accountID = freezed,
    Object? note = freezed,
    Object? expense = freezed,
    Object? method = freezed,
    Object? amount = freezed,
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
      accountID: accountID == freezed
          ? _value.accountID
          : accountID // ignore: cast_nullable_to_non_nullable
              as String,
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      expense: expense == freezed
          ? _value.expense
          : expense // ignore: cast_nullable_to_non_nullable
              as bool,
      method: method == freezed
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
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
abstract class _$FinancialTransactionCopyWith<$Res>
    implements $FinancialTransactionCopyWith<$Res> {
  factory _$FinancialTransactionCopyWith(_FinancialTransaction value,
          $Res Function(_FinancialTransaction) then) =
      __$FinancialTransactionCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String uid,
      String accountID,
      String note,
      bool expense,
      String method,
      double amount,
      DateTime date,
      DateTime dateCreated,
      DateTime dateEdited});
}

/// @nodoc
class __$FinancialTransactionCopyWithImpl<$Res>
    extends _$FinancialTransactionCopyWithImpl<$Res>
    implements _$FinancialTransactionCopyWith<$Res> {
  __$FinancialTransactionCopyWithImpl(
      _FinancialTransaction _value, $Res Function(_FinancialTransaction) _then)
      : super(_value, (v) => _then(v as _FinancialTransaction));

  @override
  _FinancialTransaction get _value => super._value as _FinancialTransaction;

  @override
  $Res call({
    Object? id = freezed,
    Object? uid = freezed,
    Object? accountID = freezed,
    Object? note = freezed,
    Object? expense = freezed,
    Object? method = freezed,
    Object? amount = freezed,
    Object? date = freezed,
    Object? dateCreated = freezed,
    Object? dateEdited = freezed,
  }) {
    return _then(_FinancialTransaction(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      accountID: accountID == freezed
          ? _value.accountID
          : accountID // ignore: cast_nullable_to_non_nullable
              as String,
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      expense: expense == freezed
          ? _value.expense
          : expense // ignore: cast_nullable_to_non_nullable
              as bool,
      method: method == freezed
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
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
class _$_FinancialTransaction extends _FinancialTransaction {
  const _$_FinancialTransaction(
      {required this.id,
      required this.uid,
      required this.accountID,
      required this.note,
      required this.expense,
      required this.method,
      required this.amount,
      required this.date,
      required this.dateCreated,
      required this.dateEdited})
      : super._();

  factory _$_FinancialTransaction.fromJson(Map<String, dynamic> json) =>
      _$$_FinancialTransactionFromJson(json);

  @override
  final String id;
  @override
  final String uid;
  @override
  final String accountID;
  @override
  final String note;
  @override
  final bool expense;
  @override
  final String method;
  @override
  final double amount;
  @override
  final DateTime date;
  @override
  final DateTime dateCreated;
  @override
  final DateTime dateEdited;

  @override
  String toString() {
    return 'FinancialTransaction(id: $id, uid: $uid, accountID: $accountID, note: $note, expense: $expense, method: $method, amount: $amount, date: $date, dateCreated: $dateCreated, dateEdited: $dateEdited)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FinancialTransaction &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality().equals(other.accountID, accountID) &&
            const DeepCollectionEquality().equals(other.note, note) &&
            const DeepCollectionEquality().equals(other.expense, expense) &&
            const DeepCollectionEquality().equals(other.method, method) &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
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
      const DeepCollectionEquality().hash(accountID),
      const DeepCollectionEquality().hash(note),
      const DeepCollectionEquality().hash(expense),
      const DeepCollectionEquality().hash(method),
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(dateCreated),
      const DeepCollectionEquality().hash(dateEdited));

  @JsonKey(ignore: true)
  @override
  _$FinancialTransactionCopyWith<_FinancialTransaction> get copyWith =>
      __$FinancialTransactionCopyWithImpl<_FinancialTransaction>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FinancialTransactionToJson(this);
  }
}

abstract class _FinancialTransaction extends FinancialTransaction {
  const factory _FinancialTransaction(
      {required String id,
      required String uid,
      required String accountID,
      required String note,
      required bool expense,
      required String method,
      required double amount,
      required DateTime date,
      required DateTime dateCreated,
      required DateTime dateEdited}) = _$_FinancialTransaction;
  const _FinancialTransaction._() : super._();

  factory _FinancialTransaction.fromJson(Map<String, dynamic> json) =
      _$_FinancialTransaction.fromJson;

  @override
  String get id;
  @override
  String get uid;
  @override
  String get accountID;
  @override
  String get note;
  @override
  bool get expense;
  @override
  String get method;
  @override
  double get amount;
  @override
  DateTime get date;
  @override
  DateTime get dateCreated;
  @override
  DateTime get dateEdited;
  @override
  @JsonKey(ignore: true)
  _$FinancialTransactionCopyWith<_FinancialTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}
