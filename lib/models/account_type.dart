import 'package:growth/constants/sqlite_names.dart';
import 'package:uuid/uuid.dart';

class AccountType {
  static String materialFamily = "MaterialIcons";
  final Uuid uuid = const Uuid();

  late String _id;
  String? uid;
  late String name;
  late String iconFamily;
  late int iconPoint;

  AccountType({
    String? id,
    this.uid,
    required this.name,
    required this.iconPoint,
    required this.iconFamily,
  }) {
    _id = id ?? uuid.v4();
  }

  String get id => _id;

  /// Translate the account type into a map.
  /// Return a [Map] with <String, dynamic>.
  Map<String, dynamic> toMap() {
    Map<String, dynamic> tempMap = <String, dynamic>{
      SQLiteNames.id: _id,
      SQLiteNames.userId: uid,
      SQLiteNames.name: name,
      SQLiteNames.iconPoint: iconPoint,
      SQLiteNames.iconFamily: iconFamily
    };
    return tempMap;
  }

  /// Decode a map into an account type.
  /// Take in a [Map] with <String, dynamic>.
  AccountType.fromMap(Map<dynamic, dynamic> map) {
    _id = map[SQLiteNames.id];
    uid = map[SQLiteNames.userId] ?? "";
    name = map[SQLiteNames.name];
    iconPoint = map[SQLiteNames.iconPoint];
    iconFamily = map[SQLiteNames.iconFamily];
  }

  /// Create an account type from a map.
  /// Take in a [Map] with <String, dynamic>.
  /// Return an [AccountType].
  AccountType fromValue(Map<dynamic, dynamic> map) {
    AccountType accountType = AccountType(
      id: map[SQLiteNames.id],
      uid: map[SQLiteNames.userId] ?? "",
      name: map[SQLiteNames.name],
      iconPoint: map[SQLiteNames.iconPoint],
      iconFamily: map[SQLiteNames.iconFamily],
    );

    return accountType;
  }
}
