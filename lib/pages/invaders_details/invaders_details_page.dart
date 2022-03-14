import 'package:animate_do/animate_do.dart';
import 'package:challenge_ubertrack/pages/home/models/people_model.dart';
import 'package:challenge_ubertrack/pages/invaders_details/invaders_details_view_model.dart';
import 'package:challenge_ubertrack/resources/assets.dart';
import 'package:challenge_ubertrack/widgets/background_image.dart';
import 'package:challenge_ubertrack/widgets/custom_loading_spinner.dart';
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
          centerTitle: true,
        ),
        body: BackgroundWidget(
            child: _homeVm.isPageLoaded == true
                ? FadeIn(
                    child: Column(
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.025),
                        _extraDetails(context),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.025),
                      ],
                    ),
                  )
                : CustomLoadingSpinner()));
  }

  Widget _extraDetails(BuildContext context) {
    final _invadersVm =
        Provider.of<InvadersDetailsViewModel>(context, listen: false);

    final _size = MediaQuery.of(context).size;

    final _titleStyle = TextStyle(
        color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold);

    final _characteristicsStyle = TextStyle(color: Colors.white, fontSize: 18);

    return Card(
        color: Colors.grey[900],
        child: Column(
          children: [
            ListTile(
              isThreeLine: true,
              title:
                  Text('Invader physical characteristics', style: _titleStyle),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: _size.height * 0.02),
                  Text('Hair color: ' + widget.selectedPeople.hairColor!,
                      style: _characteristicsStyle),
                  Text('Skin color: ' + widget.selectedPeople.skinColor!,
                      style: _characteristicsStyle),
                  Text('Eyes color: ' + widget.selectedPeople.eyeColor!,
                      style: _characteristicsStyle),
                ],
              ),
            ),
            SizedBox(height: _size.height * 0.025),
            ListTile(
              isThreeLine: true,
              title: Text('Homeworld which he belongs', style: _titleStyle),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: _size.height * 0.02),
                  Text('Homeworlds name: ' + _invadersVm.homeWorld.name!,
                      style: _characteristicsStyle),
                  Text('Climate: ' + _invadersVm.homeWorld.climate!,
                      style: _characteristicsStyle),
                  Text('Terrain: ' + _invadersVm.homeWorld.terrain!,
                      style: _characteristicsStyle),
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
              title: Text('Starships', style: _titleStyle),
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
              title: Text('Vehicles', style: _titleStyle),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: _size.height * 0.02),
                  _invadersVm.starshipList.length == 0
                      ? new Text(
                          'None',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )
                      : _invadersVm.vehicleList.length != 0
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: _invadersVm.vehicleList
                                  .map((vehicle) => new Text(
                                        vehicle.name!,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      ))
                                  .toList())
                          : Text(
                              'None',
                              style: _characteristicsStyle,
                            )
                ],
              ),
            ),
          ],
        ));
  }
}
