import 'package:challenge_ubertrack/hive/hive.dart';
import 'package:hive/hive.dart';

part 'network_preferences.g.dart';

@HiveType(typeId: 1)
class NetworkPreferences {
  NetworkPreferences();

  @HiveField(0)
  bool isOnline = false;

  // GETTER y SETTER
  bool get networkStatus {
    return hiveModule.box.get('networkStatus');
  }

  set networkStatus(bool value) {
    hiveModule.box.put('networkStatus', value);
  }
}
