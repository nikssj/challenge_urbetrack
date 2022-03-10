import 'package:animate_do/animate_do.dart';
import 'package:challenge_ubertrack/widgets/responsive_body.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Star Wars'),
        centerTitle: true,
      ),
      body: ResponsiveBody(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/background_home.gif',
                fit: BoxFit.fill,
              ),
            ),
            FadeInDown(
              child: Image.asset(
                'assets/star_wars_logo.png',
                height: _size.height * 0.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
