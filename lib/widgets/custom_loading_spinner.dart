import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomLoadingSpinner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitRipple(
        color: Colors.redAccent,
        size: MediaQuery.of(context).size.width * 0.35,
      ),
    );
  }
}
