import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_type.freezed.dart';
part 'account_type.g.dart';

@freezed
class AccountType with _$AccountType {
  static String materialFamily = "MaterialIcons";
  const AccountType._(); // Added constructor

  const factory AccountType({
    required String id,
    @Default("GROWTH") String uid,
    required String name,
    required int iconPoint,
    required String iconFamily,
  }) = _AccountType;

  factory AccountType.fromJson(Map<String, dynamic> json) =>
      _$AccountTypeFromJson(json);
}
