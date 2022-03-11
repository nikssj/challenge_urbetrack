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

  Future<List<People>?> fetchPeople(BuildContext context) async {
    setState(ViewState.Busy);

    final response = await starWarsRepository.getPeople(context);

    setPeopleList = response;

    setState(ViewState.Idle);
  }

  void loadPage(BuildContext context) async {
    await fetchPeople(context);
  }
}
