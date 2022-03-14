import 'package:animate_do/animate_do.dart';
import 'package:challenge_ubertrack/core/base_model.dart';
import 'package:challenge_ubertrack/pages/home/models/people_model.dart';
import 'package:challenge_ubertrack/pages/invaders_details/invaders_details_view_model.dart';
import 'package:challenge_ubertrack/resources/assets.dart';
import 'package:challenge_ubertrack/widgets/responsive_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InvadersDetailsPage extends StatefulWidget {
  final People selectedPeople;

  InvadersDetailsPage(this.selectedPeople);

  @override
  _InvadersDetailsPageState createState() => _InvadersDetailsPageState();
}

class _InvadersDetailsPageState extends State<InvadersDetailsPage> {
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      Provider.of<InvadersDetailsViewModel>(context, listen: false)
          .loadPage(context, widget.selectedPeople);
    });
  }

  @override
  Widget build(BuildContext context) {
    final _homeVm =
        Provider.of<InvadersDetailsViewModel>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        shadowColor: Colors.white,
        title: Text(
          'Invader details',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: ResponsiveBody(
        child: Stack(children: [
          Image.asset(Assets.deathStarImage),
          _homeVm.state == ViewState.Idle
              ? FadeInUp(
                  child: Column(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.025),
                      extraDetails(context),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.025),
                    ],
                  ),
                )
              : Center(child: CircularProgressIndicator()),
        ]),
      ),
    );
  }

  Widget extraDetails(BuildContext context) {
    final _invadersVm =
        Provider.of<InvadersDetailsViewModel>(context, listen: false);

    final _size = MediaQuery.of(context).size;

    return Card(
        color: Colors.grey[900],
        child: Column(
          children: [
            ListTile(
              isThreeLine: true,
              title: Text(
                'Invader physical characteristics',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: _size.height * 0.02),
                  Text(
                    'Hair color: ' + widget.selectedPeople.hairColor!,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    'Skin color: ' + widget.selectedPeople.skinColor!,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    'Eyes color: ' + widget.selectedPeople.eyeColor!,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            SizedBox(height: _size.height * 0.025),
            ListTile(
              isThreeLine: true,
              title: Text(
                'Homeworld which he belongs',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: _size.height * 0.02),
                  Text(
                    'Homeworlds name: ' + _invadersVm.homeWorld.name!,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    'Climate: ' + _invadersVm.homeWorld.climate!,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    'Terrain: ' + _invadersVm.homeWorld.terrain!,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'Population: ' + _invadersVm.homeWorld.population!,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            SizedBox(height: _size.height * 0.025),
            ListTile(
              isThreeLine: true,
              title: Text(
                'Starships',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: _size.height * 0.02),
                  _invadersVm.starshipList.length == 0
                      ? new Text(
                          'None',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: _invadersVm.starshipList
                              .map((starship) => new Text(
                                    starship.name!,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ))
                              .toList())
                ],
              ),
            ),
            ListTile(
              isThreeLine: true,
              title: Text(
                'Vehicles',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: _size.height * 0.02),
                  _invadersVm.starshipList.length == 0
                      ? new Text(
                          'None',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: _invadersVm.vehicleList
                              .map((vehicle) => new Text(
                                    vehicle.name ?? 'None',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ))
                              .toList())
                ],
              ),
            ),
          ],
        ));
  }
}
