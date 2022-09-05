import 'package:cuidapet_mobile_2/app/core/database/migrations/migration.dart';
import 'package:sqflite/sqflite.dart';

class MigrationV1 extends Migration {
  @override
  void create(Batch batch) {
    batch.execute('''
      CREATE TABLE address (
        id INTEGER PRIMARY KEY AUTOINCREMENT, 
        address TEXT NOT NULL, 
        lat TEXT, 
        lng TEXT, 
        additional TEXT
      )
    ''');
  }

  @override
  void update(Batch batch) {}
}
