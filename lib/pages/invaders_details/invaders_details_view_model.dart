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

  set vehicleList(List<Vehicle> value) => this._vehicleList = value;

  //Starship List
  List<Starship> _starshipList = [];

  List<Starship> get starshipList => this._starshipList;

  set starshipList(List<Starship> value) => this._starshipList = value;

  //Homeworld
  Planet _homeWorld = Planet();

  Planet get homeWorld => this._homeWorld;

  set homeWorld(Planet value) => this._homeWorld = value;

  Future<List<Vehicle>?> fetchVehicles(
      BuildContext context, List<String>? vehicles) async {
    List<String> _vehicleFutures = [];

    for (var vehicle in vehicles!) {
      _vehicleFutures.add(vehicle);
    }
  }

  void loadPage(BuildContext context, People selectedPeople) async {
    fetchVehicles(context, selectedPeople.vehicles);
  }
}
