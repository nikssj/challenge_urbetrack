// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:challenge_ubertrack/pages/intro/intro_view_model.dart';
import 'package:challenge_ubertrack/resources/assets.dart';
import 'package:challenge_ubertrack/widgets/responsive_body.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      Provider.of<IntroViewModel>(context, listen: false).loadPage();
    });
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Scaffold(
      body: ResponsiveBody(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              child: Image.asset(Assets.backgroundIntro, fit: BoxFit.fill),
            ),
            FadeInDown(
              child:
                  Image.asset(Assets.logoStarWars, height: _size.height * 0.3),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.3,
              child: FadeIn(
                child: AnimatedTextKit(
                  totalRepeatCount: 1,
                  animatedTexts: [
                    TypewriterAnimatedText('\nDeveloped by\nhttps://nikssj.dev',
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 34,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                        speed: Duration(milliseconds: 50)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
