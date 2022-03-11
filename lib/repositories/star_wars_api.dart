import 'package:challenge_ubertrack/core/api_base_helper.dart';
import 'package:challenge_ubertrack/pages/home/models/people_model.dart';
import 'package:challenge_ubertrack/pages/invaders_details/models/planet_model.dart';
import 'package:challenge_ubertrack/pages/invaders_details/models/starship_model.dart';
import 'package:challenge_ubertrack/pages/invaders_details/models/vehicle_model.dart';
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

  Future<List<Planet>?> getPlanet(
      BuildContext context, String idPlaneta) async {
    final response = await _helper.get('/planets/' + idPlaneta, context);

    List<Planet>? planetList;

    planetList = Planet.fromJson(response) as List<Planet>?;

    return planetList;
  }

  Future<List<Vehicle>?> getVehicle(
      BuildContext context, String idVehicle) async {
    final response = await _helper.get('/vehicles/' + idVehicle, context);

    List<Vehicle>? vehicleList;

    vehicleList = Vehicle.fromJson(response) as List<Vehicle>?;

    return vehicleList;
  }

  Future<List<Starship>?> getStarship(
      BuildContext context, String idStarship) async {
    final response = await _helper.get('/starships/' + idStarship, context);

    List<Starship>? starshipList;

    starshipList = Starship.fromJson(response) as List<Starship>?;

    return starshipList;
  }
}
