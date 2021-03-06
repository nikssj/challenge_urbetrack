// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:challenge_ubertrack/pages/home/home_page_view_model.dart';
import 'package:challenge_ubertrack/pages/intro/intro_view_model.dart';
import 'package:challenge_ubertrack/pages/invaders_details/invaders_details_view_model.dart';

class Providers extends StatefulWidget {
  final Widget child;
  Providers({required this.child});

  @override
  State<Providers> createState() => _ProvidersState();
}

class _ProvidersState extends State<Providers> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<IntroViewModel>(
        create: (_) => IntroViewModel(),
      ),
      ChangeNotifierProvider<HomePageViewModel>(
        create: (_) => HomePageViewModel(),
      ),
      ChangeNotifierProvider<InvadersDetailsViewModel>(
        create: (_) => InvadersDetailsViewModel(),
      ),
    ], child: widget.child);
  }
}
