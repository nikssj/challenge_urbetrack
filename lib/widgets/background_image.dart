// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:challenge_ubertrack/resources/assets.dart';

class BackgroundWidget extends StatelessWidget {
  final Widget child;

  BackgroundWidget({required this.child});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        position: DecorationPosition.background,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.deathStarImage), fit: BoxFit.cover)),
        child: child);
  }
}
