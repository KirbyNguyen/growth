class AccountType {
  static String materialFamily = "MaterialIcons";
  late String _id = "GENERIC_INFORMATION";
  String name;
  int iconPoint;
  String iconFamily;

  AccountType({
    String? id,
    required this.name,
    required this.iconPoint,
    required this.iconFamily,
  }) {
    _id = id ?? _id;
  }

  String get id => _id;
}
