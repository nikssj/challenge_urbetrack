import 'package:animate_do/animate_do.dart';
import 'package:challenge_ubertrack/widgets/responsive_body.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Star Wars'),
        centerTitle: true,
      ),
      body: ResponsiveBody(
        child: Stack(
          alignment: Alignment.center,
          // fit: StackFit.expand,
          fit: StackFit.passthrough,
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/background_home.gif',
                fit: BoxFit.fill,
              ),
            ),
            FadeInDown(
              child: Image(
                image: AssetImage('assets/star_wars_logo.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
