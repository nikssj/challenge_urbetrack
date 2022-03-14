import 'package:challenge_ubertrack/widgets/responsive_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:challenge_ubertrack/pages/home/models/people_model.dart';
import 'package:challenge_ubertrack/pages/invaders_details/invaders_details_view_model.dart';
import 'package:challenge_ubertrack/widgets/background_image.dart';
import 'package:challenge_ubertrack/widgets/custom_loading_spinner.dart';

class InvadersDetailsPage extends StatefulWidget {
  final People selectedPeople;

  InvadersDetailsPage({required this.selectedPeople});

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

    final _size = MediaQuery.of(context).size;

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
                ? Container(
                    height: _size.height,
                    child: SingleChildScrollView(
                      child: FadeIn(
                        child: Column(
                          children: [
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.025),
                            _extraDetails(context),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.025),
                            FloatingActionButton.extended(
                                onPressed: () {},
                                label: Text(
                                  'Report invader'.toUpperCase(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                backgroundColor: Colors.redAccent.shade700),
                            SizedBox(height: _size.height * 0.025)
                          ],
                        ),
                      ),
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

    final _characteristicsStyle = TextStyle(
        color: Colors.white70, fontSize: 18, fontWeight: FontWeight.bold);

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: Colors.grey[900],
      child: Column(
        children: [
          SizedBox(height: _size.height * 0.025),
          AnimatedTextKit(
            totalRepeatCount: 1,
            animatedTexts: [
              TypewriterAnimatedText(widget.selectedPeople.name!.toUpperCase(),
                  textStyle: _titleStyle, speed: Duration(milliseconds: 100)),
            ],
          ),
          SizedBox(height: _size.height * 0.02),
          Divider(color: Colors.grey, height: 1),
          SizedBox(height: _size.height * 0.02),
          ListTile(
            title: Text('Invader physical characteristics', style: _titleStyle),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('・Hair color: ' + widget.selectedPeople.hairColor!,
                    style: _characteristicsStyle),
                Text('・Skin color: ' + widget.selectedPeople.skinColor!,
                    style: _characteristicsStyle),
                Text('・Eyes color: ' + widget.selectedPeople.eyeColor!,
                    style: _characteristicsStyle),
              ],
            ),
          ),
          SizedBox(height: _size.height * 0.02),
          ListTile(
            title: Text('Homeworld which he belongs', style: _titleStyle),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('・Homeworlds name: ' + _invadersVm.homeWorld.name!,
                    style: _characteristicsStyle),
                Text('・Climate: ' + _invadersVm.homeWorld.climate!,
                    style: _characteristicsStyle),
                Text('・Terrain: ' + _invadersVm.homeWorld.terrain!,
                    style: _characteristicsStyle),
                Text(
                  '・Population: ' + _invadersVm.homeWorld.population!,
                  style: _characteristicsStyle,
                ),
              ],
            ),
          ),
          SizedBox(height: _size.height * 0.02),
          ListTile(
            title: Text('Starships', style: _titleStyle),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _invadersVm.starshipList.length != 0
                  ? _invadersVm.starshipList
                      .map((starship) => Text('・' + starship.name!,
                          style: _characteristicsStyle))
                      .toList()
                  : [Text('・None', style: _characteristicsStyle)],
            ),
          ),
          SizedBox(height: _size.height * 0.02),
          ListTile(
            title: Text('Vehicles', style: _titleStyle),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _invadersVm.vehicleList.length != 0
                  ? _invadersVm.vehicleList
                      .map((starship) => new Text('・' + starship.name!,
                          style: _characteristicsStyle))
                      .toList()
                  : [Text('・None', style: _characteristicsStyle)],
            ),
          ),
          SizedBox(height: _size.height * 0.02),
        ],
      ),
    );
  }
}
