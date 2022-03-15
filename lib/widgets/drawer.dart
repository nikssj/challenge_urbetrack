import 'package:challenge_ubertrack/core/sidebar_provider.dart';
import 'package:challenge_ubertrack/hive/hive.dart';
import 'package:challenge_ubertrack/hive/network_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

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
              Text(
                'Current network status: ' + 'Offline',
                style: TextStyle(color: Colors.white, fontSize: 20),
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
              Row(
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
                  GestureDetector(
                    child: Text('Developed by ',
                        style: TextStyle(
                          color: Colors.grey[200],
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  GestureDetector(
                      child: Text('https://nikssj.dev',
                          style: TextStyle(
                              decoration: TextDecoration.overline,
                              decorationThickness: 1.5,
                              color: Colors.amber,
                              fontWeight: FontWeight.bold,
                              fontSize: 13))),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.015,
              )
            ],
          );
        });
  }

  List<Widget> _crearListaItems(List<dynamic> data, context) {
    final _colorTrail = Colors.grey;

    final List<Widget> opciones = [];

    data.forEach((opt) {
      final widgetTemp = ListTile(
        onTap: () {
          NetworkPreferences(null).networkStatus = opt['networkStatus'];

          print(NetworkPreferences(null).networkStatus);

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
