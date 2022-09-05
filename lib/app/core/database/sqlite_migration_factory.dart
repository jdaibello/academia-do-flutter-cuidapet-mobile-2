import 'package:cuidapet_mobile_2/app/core/database/migrations/migration.dart';
import 'package:cuidapet_mobile_2/app/core/database/migrations/migration_v1.dart';

class SqliteMigrationFactory {
  List<Migration> getCreateMigrations() => [
        MigrationV1(),
      ];

  List<Migration> getUpdateMigrations(int version) {
    return [];
  }
}
