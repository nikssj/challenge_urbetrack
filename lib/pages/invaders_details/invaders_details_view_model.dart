// Flutter imports:
import 'package:challenge_ubertrack/pages/invaders_details/models/invader_report_model.dart';
import 'package:challenge_ubertrack/widgets/toast.dart';
import 'package:flutter/cupertino.dart';

// Project imports:
import 'package:challenge_ubertrack/core/base_model.dart';
import 'package:challenge_ubertrack/pages/home/models/people_model.dart';
import 'package:challenge_ubertrack/pages/invaders_details/models/starship_model.dart';
import 'package:challenge_ubertrack/pages/invaders_details/models/vehicle_model.dart';
import 'package:challenge_ubertrack/repositories/star_wars_api.dart';
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

  //Invader report
  InvaderReport _invaderReport = InvaderReport();

  InvaderReport get invaderReport => this._invaderReport;

  set setInvaderReport(InvaderReport value) {
    _invaderReport = value;
  }

  // ==================================== //

  //Fetch Vehicles
  Future<void> fetchVehicles(List<String> vehiclesLinks) async {
    List<Future<Vehicle>> listaFutures = <Future<Vehicle>>[];

    //Get id from VehicleLink
    for (var vehicleLink in vehiclesLinks) {
      final String vehicleId = vehicleLink.substring(vehicleLink.length - 3);

      listaFutures.add(starWarsRepository.getVehicle(vehicleId));
    }

    // Wait for all futures to complete
    final List<Vehicle> response = await Future.wait(listaFutures);

    setVehicleList = response;
  }

  //Fetch Starships
  Future<void> fetchStarships(List<String> starshipsLinks) async {
    List<Future<Starship>> listaFutures = <Future<Starship>>[];

    //Get id from StarshipLink
    for (var starshipsLink in starshipsLinks) {
      final String starshipId =
          starshipsLink.substring(starshipsLink.length - 3);

      listaFutures.add(starWarsRepository.getStarship(starshipId));
    }

    // Wait for all futures to complete
    final List<Starship> response = await Future.wait(listaFutures);

    setStarshipList = response;
  }

  //Fetch Homeworld
  Future<void> fetchHomeWorld(String planetLink) async {
    final String idPlanet = planetLink.substring(planetLink.length - 3);

    final Planet response = await starWarsRepository.getPlanet(idPlanet);

    setHomeWorld = response;
  }

  //Post InvaderReport
  Future<void> reportInvader(People invader) async {
    final now = DateTime.now();

    final InvaderReport newInvaderReport = InvaderReport(
        characterName: invader.name, userId: 1, dateTime: now.toString());

    final response = await starWarsRepository.reportInvader(newInvaderReport);

    if (response != null) {
      toastWidgetService.showToast('Invader has been reported!');
    }
  }

  clearAll() {
    vehicleList.clear();
    starshipList.clear();
    setHomeWorld = new Planet();
    setInvaderReport = new InvaderReport();
  }

  void loadPage(BuildContext context, People selectedPeople) async {
    clearAll();

    setIsPageLoaded(false);

    List<Future> futureList = <Future>[];

    futureList.add(fetchHomeWorld(selectedPeople.homeworld!));

    futureList.add(fetchVehicles(selectedPeople.vehicles!));

    futureList.add(fetchStarships(selectedPeople.starships!));

    await Future.wait(futureList);

    setIsPageLoaded(true);
  }
}
