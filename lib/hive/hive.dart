import 'package:challenge_ubertrack/hive/network_preferences.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'hive_adapters.dart';

final hiveModule = HiveModule();

//Inicializador de Hive con sus respectivos Adapters
class HiveModule {
  late Box box;

  Future<void> initModule() async {
    await Hive.initFlutter();

    box = await Hive.openBox('box');

    for (var adapter in HiveAdapters().hiveAdaptersList) {
      Hive.registerAdapter(adapter);
    }
  }
}
