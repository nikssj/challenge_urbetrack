import 'package:challenge_ubertrack/hive/invader_preferences.dart';

import 'network_preferences.dart';

//Hive adapters listado
class HiveAdapters {
  final List hiveAdaptersList = [
    NetworkPreferencesAdapter(),
    InvaderPreferencesAdapter()
  ];
}
