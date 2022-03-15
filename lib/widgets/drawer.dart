// Flutter imports:
import 'package:challenge_ubertrack/widgets/toast.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

// Project imports:
import 'package:challenge_ubertrack/core/sidebar_provider.dart';
import 'package:challenge_ubertrack/hive/network_preferences.dart';

class SideBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Container(
          color: Colors.black87,
          child: _crearRutas(context),
        ),
      ),
    );
  }

  Widget _crearRutas(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return FutureBuilder(
        future: sidebarProvider.loadData(),
        initialData: [],
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          // Builder regresa un widget
          return Column(
            children: <Widget>[
              Container(
                color: Colors.black,
                height: _size.height * 0.075,
                width: _size.width,
                child: DrawerHeader(
                  padding: EdgeInsets.only(top: _size.height * 0.025),
                  child: Text(
                    'NETWORK MODES',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: _size.height * 0.02),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: 'Current network status: ',
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                    TextSpan(
                      text: networkPreferences.networkStatus
                          ? 'Online'
                          : 'Offline',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: networkPreferences.networkStatus
                              ? Colors.green
                              : Colors.red),
                    ),
                  ],
                ),
              ),
              SizedBox(height: _size.height * 0.02),
              Divider(color: Colors.grey),
              ListView(
                shrinkWrap: true,
                children: _crearListaItems(snapshot.data!, context),
              ),
              Spacer(),
              Divider(
                color: Colors.grey[700],
                thickness: 1,
              ),
              GestureDetector(
                onTap: _launchURL,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 5),
                      child: Icon(
                        Icons.arrow_forward,
                        size: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                    Text('Developed by ',
                        style: TextStyle(
                          color: Colors.grey[200],
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        )),
                    Text('https://nikssj.dev',
                        style: TextStyle(
                            decoration: TextDecoration.overline,
                            decorationThickness: 1.5,
                            color: Colors.amber,
                            fontWeight: FontWeight.bold,
                            fontSize: 14)),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.015,
              )
            ],
          );
        });
  }

  void _launchURL() async {
    String url = 'https://nikssj.dev';
    if (!await launch(url)) throw 'Could not launch $url';
  }

  List<Widget> _crearListaItems(List<dynamic> data, context) {
    final _colorTrail = Colors.grey;

    final List<Widget> opciones = [];

    data.forEach((opt) {
      final widgetTemp = ListTile(
        onTap: () {
          networkPreferences.networkStatus = opt['networkStatus'];

          print(networkPreferences.networkStatus);

          toastWidgetService.showToast('Network is now: ' + opt['texto'] + '!');

          Get.back();
        },
        title: Text(
          'Switch to ' + opt['texto'],
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: opt['texto'] == 'Online' ? Colors.green : Colors.red),
        ),
        trailing: Icon(Icons.keyboard_arrow_right, color: _colorTrail),
      );

      opciones..add(widgetTemp);
    });

    return opciones;
  }
}
