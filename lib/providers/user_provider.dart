import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:growth/services/user_data_service.dart';

final userDataProvider = Provider<UserDataSerivce>((ref) {
  return UserDataSerivce();
});
