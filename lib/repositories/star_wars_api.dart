// Flutter imports:
import 'package:flutter/cupertino.dart';

// Project imports:
import 'package:challenge_ubertrack/core/api_base_helper.dart';
import 'package:challenge_ubertrack/pages/home/models/people_model.dart';
import 'package:challenge_ubertrack/pages/invaders_details/models/planet_model.dart';
import 'package:challenge_ubertrack/pages/invaders_details/models/starship_model.dart';
import 'package:challenge_ubertrack/pages/invaders_details/models/vehicle_model.dart';

final starWarsRepository = StarWarsRepository();

ApiBaseHelper _helper = ApiBaseHelper();

class StarWarsRepository {
  Future<List<People>> getPeople() async {
    final response = await _helper.get('/people');

    List<People> peopleList;

    peopleList = PeopleResponse.fromJson(response).results!;

    return peopleList;
  }

  Future<Planet> getPlanet(String idPlanet) async {
    final response = await _helper.get('/planets/' + idPlanet);

    Planet planet;

    planet = Planet.fromJson(response);

    return planet;
  }

  Future<Vehicle> getVehicle(String idVehicle) async {
    final response = await _helper.get('/vehicles/' + idVehicle);

    Vehicle vehicle;

    vehicle = Vehicle.fromJson(response);

    return vehicle;
  }

  Future<Starship> getStarship(String idStarship) async {
    final response = await _helper.get('/starships/' + idStarship);

    Starship starship;

    starship = Starship.fromJson(response);

    return starship;
  }
}
