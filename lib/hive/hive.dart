// Package imports:
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

// Project imports:
import 'hive_adapters.dart';

final hiveModule = HiveModule();

//Hive initializer
class HiveModule {
  late Box box;

  Future<void> initModule() async {
    await Hive.initFlutter();

    box = await Hive.openBox('box');

    for (TypeAdapter adapter in HiveAdapters().hiveAdaptersList) {
      Hive.registerAdapter(adapter);
    }
  }
}
