import 'package:challenge_ubertrack/repositories/star_wars_api.dart';
import 'package:challenge_ubertrack/widgets/responsive_body.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveBody(
        child: Column(
          children: [
            FloatingActionButton(onPressed: () async {
              await starWarsRepository.getPeople(context);
            })
          ],
        ),
      ),
    );
  }
}
