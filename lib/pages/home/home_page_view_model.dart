// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:challenge_ubertrack/core/base_model.dart';
import 'package:challenge_ubertrack/hive/network_preferences.dart';
import 'package:challenge_ubertrack/repositories/star_wars_api.dart';
import 'models/people_model.dart';

class HomePageViewModel extends BaseModel {
  List<People>? _peopleList = [];

  set setPeopleList(List<People>? peopleList) {
    _peopleList = peopleList;
  }

  List<People>? get peopleList => _peopleList;

  Future<void> fetchPeople(BuildContext context) async {
    final response = await starWarsRepository.getPeople(context);

    setPeopleList = response;
  }

  Future<void> loadPage(BuildContext context) async {
    setIsPageLoaded(false);

    if (NetworkPreferences().networkStatus) {
      await fetchPeople(context);
    }

    setIsPageLoaded(true);
  }
}
