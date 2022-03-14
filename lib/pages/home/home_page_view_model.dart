import 'package:challenge_ubertrack/core/base_model.dart';
import 'package:challenge_ubertrack/repositories/star_wars_api.dart';
import 'package:flutter/material.dart';

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

  void loadPage(BuildContext context) async {
    setIsPageLoaded(false);

    await fetchPeople(context);

    setIsPageLoaded(true);
  }
}
