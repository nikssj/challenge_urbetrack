// Flutter imports:
import 'package:challenge_ubertrack/pages/intro/intro_page.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:challenge_ubertrack/hive/network_preferences.dart';
import 'core/providers.dart';
import 'hive/hive.dart';
import 'pages/home/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await hiveModule.initModule();

  //Network status offline when app launched
  NetworkPreferences().networkStatus = false;

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
