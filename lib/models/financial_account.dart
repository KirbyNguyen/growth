import 'package:freezed_annotation/freezed_annotation.dart';

part 'financial_account.freezed.dart';
part 'financial_account.g.dart';

@freezed
class FinancialAccount with _$FinancialAccount {
  const FinancialAccount._();

  const factory FinancialAccount({
    required String id,
    required String uid,
    required String typeID,
    required String name,
    required double balance,
    required String currencyCode,
    required int colorValue,
  }) = _FinancialAccount;

  factory FinancialAccount.fromJson(Map<String, dynamic> json) =>
      _$FinancialAccountFromJson(json);
}
