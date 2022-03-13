import 'package:challenge_ubertrack/pages/intro/intro_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/providers.dart';
import 'pages/home/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
