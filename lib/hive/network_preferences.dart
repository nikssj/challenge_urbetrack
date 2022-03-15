import 'package:challenge_ubertrack/hive/hive.dart';
import 'package:hive/hive.dart';

part 'network_preferences.g.dart';

@HiveType(typeId: 1)
class NetworkPreferences {
  NetworkPreferences(this.isOnline);

  @HiveField(0)
  bool? isOnline;

  // GETTER y SETTER
  bool get networkStatus {
    return hiveModule.box.get('networkStatus');
  }

  set networkStatus(bool value) {
    hiveModule.box.put('networkStatus', value);
  }
}
