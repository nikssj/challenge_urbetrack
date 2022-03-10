import 'package:challenge_ubertrack/pages/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      ChangeNotifierProvider<HomeViewModel>(
        create: (_) => HomeViewModel(),
      ),
    ], child: widget.child);
  }
}
