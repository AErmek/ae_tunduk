import 'package:cv_scan_core/cv_scan_core.dart';
import 'package:cv_scan_data/src/local/database/app_database.dart';

class DatabaseFactory {
  const DatabaseFactory._();

  static AppDatabase create() {
    final config = Config.i.database;
    return AppDatabase(fileName: config.fileName);
  }
}
