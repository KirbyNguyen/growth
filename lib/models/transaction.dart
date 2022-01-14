import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction.freezed.dart';
part 'transaction.g.dart';

@freezed
class Transaction with _$Transaction {
  const Transaction._();

  const factory Transaction({
    required String id,
    required String uid,
    required String typeID,
    required String accountID,
    required String note,
    required String name,
    required String method,
    required DateTime date,
    required DateTime dateCreated,
    required DateTime dateEdited,
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
}
