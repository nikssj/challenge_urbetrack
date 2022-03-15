// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:challenge_ubertrack/core/base_model.dart';
import 'package:challenge_ubertrack/pages/home/home_page.dart';

class IntroViewModel extends BaseModel {
  void loadPage() async {
    await Future.delayed(Duration(milliseconds: 3000));

    Get.to(() => HomePage());
  }
}
