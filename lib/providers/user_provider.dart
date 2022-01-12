import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:growth/services/user_data_services.dart';

final userDataProvider = Provider<UserDataSerivces>((ref) {
  return UserDataSerivces();
});
