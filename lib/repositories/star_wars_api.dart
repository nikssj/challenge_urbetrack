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
  Future<List<People>> getPeople(BuildContext context) async {
    final response = await _helper.get('/people', context);

    List<People> peopleList;

    peopleList = PeopleResponse.fromJson(response).results!;

    return peopleList;
  }

  Future<Planet> getPlanet(BuildContext context, String idPlanet) async {
    final response = await _helper.get('/planets/' + idPlanet, context);

    Planet planet;

    planet = Planet.fromJson(response);

    return planet;
  }

  Future<Vehicle> getVehicle(BuildContext context, String idVehicle) async {
    final response = await _helper.get('/vehicles/' + idVehicle, context);

    Vehicle vehicle;

    vehicle = Vehicle.fromJson(response);

    return vehicle;
  }

  Future<Starship> getStarship(BuildContext context, String idStarship) async {
    final response = await _helper.get('/starships/' + idStarship, context);

    Starship starship;

    starship = Starship.fromJson(response);

    return starship;
  }
}
