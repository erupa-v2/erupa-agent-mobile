import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

import '../../core/user/domain/entities/user.dart';

/// Add adapters to Hive per entity
class HiveAdapters {
  /// User Entity
  static const user = 0;

  /// Initialize adapters when app starts
  static Future<void> setUp() async {
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(appDocumentDirectory.path);
    Hive.registerAdapter<User>(UserAdapter());
  }
}
