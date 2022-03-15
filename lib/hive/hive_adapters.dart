// Project imports:
import 'package:challenge_ubertrack/hive/invader_preferences.dart';
import 'network_preferences.dart';

//Hive adapters list
class HiveAdapters {
  final List hiveAdaptersList = [
    NetworkPreferencesAdapter(),
    InvaderPreferencesAdapter()
  ];
}
