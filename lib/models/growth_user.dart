import 'package:growth/constants/database_names.dart';

class GrowthUser {
  late final String _uid;

  int _coin = 0;
  bool _subscribed = false;

  late String email;
  late String name;

  GrowthUser({required String uid, required this.email, required this.name}) {
    _uid = uid;
  }

  String get uid => _uid;

  bool get isSubscribed => _subscribed;
  void toggleSubscription() => !_subscribed;

  void changeCoinAmount(int amount) {
    _coin += amount;
  }

  GrowthUser.fromJson(Map<String, dynamic> json) {
    _coin = json[DatabaseNames.coin] as int;
    _uid = json[DatabaseNames.uid] as String;
    name = json[DatabaseNames.name] as String;
    email = json[DatabaseNames.email] as String;
    _subscribed = json[DatabaseNames.subscribed] as bool;
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        DatabaseNames.uid: _uid,
        DatabaseNames.name: name,
        DatabaseNames.coin: _coin,
        DatabaseNames.email: email,
        DatabaseNames.subscribed: _subscribed,
      };
}
