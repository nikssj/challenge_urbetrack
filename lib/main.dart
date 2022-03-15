import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/providers.dart';
import 'hive/hive.dart';
import 'pages/home/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await hiveModule.initModule();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Providers(
      child: GetMaterialApp(
          navigatorKey: Get.key,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: 'Hubballi'),
          home: HomePage()),
    );
  }
}
