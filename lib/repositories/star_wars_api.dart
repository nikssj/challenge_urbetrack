import 'package:challenge_ubertrack/core/api_base_helper.dart';
import 'package:challenge_ubertrack/pages/home_page/models/people_model.dart';
import 'package:flutter/cupertino.dart';

final starWarsRepository = StarWarsRepository();

ApiBaseHelper _helper = ApiBaseHelper();

class StarWarsRepository {
  Future<List<People>?> getPeople(BuildContext context) async {
    final response = await _helper.get('/people', context);

    List<People>? peopleList;

    peopleList = PeopleResponse.fromJson(response).results;

    return peopleList;
  }
}
