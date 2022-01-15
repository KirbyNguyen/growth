import 'package:freezed_annotation/freezed_annotation.dart';

part 'financial_transaction.freezed.dart';
part 'financial_transaction.g.dart';

@freezed
class FinancialTransaction with _$FinancialTransaction {
  const FinancialTransaction._();

  const factory FinancialTransaction({
    required String id,
    required String uid,
    required String accountID,
    required String note,
    required String method,
    required DateTime date,
    required DateTime dateCreated,
    required DateTime dateEdited,
  }) = _FinancialTransaction;

  factory FinancialTransaction.fromJson(Map<String, dynamic> json) =>
      _$FinancialTransactionFromJson(json);
}
