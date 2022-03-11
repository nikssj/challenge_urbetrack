import 'package:challenge_ubertrack/pages/home/models/people_model.dart';
import 'package:challenge_ubertrack/pages/invaders_details/invaders_details_view_model.dart';
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
    return Scaffold();
  }
}
