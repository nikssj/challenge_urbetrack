import 'package:challenge_ubertrack/core/base_model.dart';
import 'package:challenge_ubertrack/pages/home/models/people_model.dart';
import 'package:challenge_ubertrack/pages/invaders_details/models/starship_model.dart';
import 'package:challenge_ubertrack/pages/invaders_details/models/vehicle_model.dart';
import 'package:challenge_ubertrack/repositories/star_wars_api.dart';
import 'package:flutter/cupertino.dart';

import 'models/planet_model.dart';

class InvadersDetailsViewModel extends BaseModel {
  //Vehicle List
  List<Vehicle> _vehicleList = [];

  List<Vehicle> get vehicleList => this._vehicleList;

  set setVehicleList(List<Vehicle> value) {
    vehicleList.addAll(value);
  }

  //Starship List
  List<Starship> _starshipList = [];

  List<Starship> get starshipList => this._starshipList;

  set setStarshipList(List<Starship> value) {
    starshipList.addAll(value);
  }

  //Homeworld
  Planet _homeWorld = Planet();

  Planet get homeWorld => this._homeWorld;

  set setHomeWorld(Planet value) {
    _homeWorld = value;
  }

  //FetchVehicles
  Future fetchVehicles(BuildContext context, List<String> vehiclesLinks) async {
    List<Future<Vehicle>> listaFutures = <Future<Vehicle>>[];

    //Get id from VehicleLink
    for (var vehicleLink in vehiclesLinks) {
      final String vehicleId = vehicleLink.substring(vehicleLink.length - 3);

      listaFutures.add(starWarsRepository.getVehicle(context, vehicleId));
    }

    // Wait for all futures to complete
    final response = await Future.wait(listaFutures);

    setVehicleList = response;
  }

  //FetchStarships
  Future fetchStarships(
      BuildContext context, List<String> starshipsLinks) async {
    List<Future<Starship>> listaFutures = <Future<Starship>>[];

    //Get id from StarshipLink
    for (var starshipsLink in starshipsLinks) {
      final String starshipId =
          starshipsLink.substring(starshipsLink.length - 3);

      listaFutures.add(starWarsRepository.getStarship(context, starshipId));
    }

    // Wait for all futures to complete
    final response = await Future.wait(listaFutures);

    setStarshipList = response;
  }

  //FetchStarships
  Future fetchHomeWorld(BuildContext context, String planetLink) async {
    final String idPlanet = planetLink.substring(planetLink.length - 3);

    final response = await starWarsRepository.getPlanet(context, idPlanet);

    setHomeWorld = response;
  }

  clearAll() {
    vehicleList.clear();
    starshipList.clear();
  }

  void loadPage(BuildContext context, People selectedPeople) async {
    setState(ViewState.Busy);

    clearAll();

    List<Future> futureList = <Future>[];

    futureList.add(fetchHomeWorld(context, selectedPeople.homeworld!));

    futureList.add(fetchVehicles(context, selectedPeople.vehicles!));

    futureList.add(fetchStarships(context, selectedPeople.starships!));

    await Future.wait(futureList);

    setState(ViewState.Idle);
  }
}
