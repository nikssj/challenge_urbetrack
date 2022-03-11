import 'package:animate_do/animate_do.dart';
import 'package:challenge_ubertrack/pages/intro/intro_view_model.dart';
import 'package:challenge_ubertrack/widgets/responsive_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.3,
              child: FadeInUp(
                child: Text('Desarrollado por\nhttp://nikssj.dev',
                    style: TextStyle(color: Colors.white, fontSize: 36)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
