// Project imports:

import 'package:challenge_ubertrack/core/api_base_helper.dart';
import 'package:challenge_ubertrack/pages/home/models/people_model.dart';
import 'package:challenge_ubertrack/pages/invaders_details/models/invader_report_model.dart';
import 'package:challenge_ubertrack/pages/invaders_details/models/planet_model.dart';
import 'package:challenge_ubertrack/pages/invaders_details/models/starship_model.dart';
import 'package:challenge_ubertrack/pages/invaders_details/models/vehicle_model.dart';

final starWarsRepository = StarWarsRepository();

ApiBaseHelper _helper = ApiBaseHelper();

class StarWarsRepository {
  Future<List<People>> getPeople() async {
    final response = await _helper.get(null, '/people');

    List<People> peopleList;

    peopleList = PeopleResponse.fromJson(response).results!;

    return peopleList;
  }

  Future<Planet> getPlanet(String idPlanet) async {
    final response = await _helper.get(null, '/planets/' + idPlanet);

    Planet planet;

    planet = Planet.fromJson(response);

    return planet;
  }

  Future<Vehicle> getVehicle(String idVehicle) async {
    final response = await _helper.get(null, '/vehicles/' + idVehicle);

    Vehicle vehicle;

    vehicle = Vehicle.fromJson(response);

    return vehicle;
  }

  Future<Starship> getStarship(String idStarship) async {
    final response = await _helper.get(null, '/starships/' + idStarship);

    Starship starship;

    starship = Starship.fromJson(response);

    return starship;
  }

  Future<dynamic> reportInvader(InvaderReport invaderReport) async {
    final response = await _helper.post(
        'https://jsonplaceholder.typicode.com/posts/', '', invaderReport);

    return response;
  }
}
