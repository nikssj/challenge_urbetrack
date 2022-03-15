// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:challenge_ubertrack/hive/network_preferences.dart';
import 'package:challenge_ubertrack/pages/home/home_page_view_model.dart';

class NetworkMessageCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _homeVm = Provider.of<HomePageViewModel>(context, listen: false);

    final _size = MediaQuery.of(context).size;

    return Card(
      color: Colors.grey[900],
      child: Container(
        margin: EdgeInsets.symmetric(vertical: _size.height * 0.05),
        child: Column(
          children: [
            SizedBox(height: _size.height * 0.025),
            Text(
              'Please switch to online mode to check if there are any invaders',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            SizedBox(height: _size.height * 0.05),
            FloatingActionButton.extended(
                onPressed: () async {
                  NetworkPreferences().networkStatus = true;

                  await _homeVm.loadPage(context);
                },
                label: Text(
                  'SWITCH TO ONLINE MODE'.toUpperCase(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                backgroundColor: Colors.green),
          ],
        ),
      ),
    );
  }
}
