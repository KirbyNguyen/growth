import 'package:sqflite/sqflite.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:growth/databases/sql_database.dart';
import 'package:growth/services/sqlite_services.dart';

final sqliteServicesProvider = Provider<SQLiteServices>(
  (ref) {
    return SQLiteServices.instance;
  },
);

final sqliteDatabaseProvider = FutureProvider<Database?>(
  (ref) async {
    return ref.read(sqliteServicesProvider).database;
  },
);

final sqliteProvider = FutureProvider<SQLiteDatabase>((ref) async {
  SQLiteDatabase provider = SQLiteDatabase(ref.read(sqliteServicesProvider));
  await provider.init();
  return provider;
});
