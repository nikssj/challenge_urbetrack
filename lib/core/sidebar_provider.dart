// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/services.dart' show rootBundle;

// Project imports:

class SideBarProvider {
  List<dynamic> options = [];

  SideBarProvider() {
    loadData();
  }
  Future<List<dynamic>> loadData() async {
    var resp = await rootBundle.loadString('data/network_mode.json');

    Map dataMap = json.decode(resp);

    options = dataMap['network_modes'];

    return options;
  }
}

final sidebarProvider = new SideBarProvider();
