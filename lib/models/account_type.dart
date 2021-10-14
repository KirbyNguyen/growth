class AccountType {
  static String materialFamily = "MaterialIcons";
  late String _id;
  String name;
  int iconPoint;
  String iconFamily;

  AccountType({
    required String id,
    required this.name,
    required this.iconPoint,
    required this.iconFamily,
  }) {
    _id = id;
  }

  String get id => _id;
}
