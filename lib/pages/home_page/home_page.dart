import 'package:animate_do/animate_do.dart';
import 'package:challenge_ubertrack/core/base_model.dart';
import 'package:challenge_ubertrack/pages/home_page/home_page_view_model.dart';
import 'package:challenge_ubertrack/widgets/responsive_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      Provider.of<HomePageViewModel>(context, listen: false).loadPage(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final _homeVm = Provider.of<HomePageViewModel>(context, listen: true);

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          shadowColor: Colors.white,
          title: Text(
            'Listado de amenazas',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
        ),
        body: ResponsiveBody(
            child: Stack(children: [
          Image.asset('assets/death_star.jpg'),
          _homeVm.state == ViewState.Idle
              ? FadeInUp(
                  child: Column(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.025),
                      starWarsPeople(context),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.025),
                    ],
                  ),
                )
              : Center(child: CircularProgressIndicator()),
        ])),
      ),
    );
  }
}

Widget starWarsPeople(BuildContext context) {
  final _homeVm = Provider.of<HomePageViewModel>(context, listen: false);

  final _size = MediaQuery.of(context).size;

  return _homeVm.peopleList?.length == 0
      ? Text('No hay invasores')
      : Container(
          height: _size.height,
          child: ListView.builder(
            itemCount: _homeVm.peopleList?.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.grey[900],
                child: ListTile(
                  isThreeLine: true,
                  focusColor: Colors.yellow,
                  selectedTileColor: Colors.yellow,
                  hoverColor: Colors.yellow,
                  onTap: () {
                    print('hola');
                  },
                  title: Text(_homeVm.peopleList![index].name!,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),
                  subtitle: Text(
                      'Altura: ' + _homeVm.peopleList![index].height! + 'cm',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),
                  trailing: Column(
                    children: [
                      Text('Gender: ' + _homeVm.peopleList![index].gender!,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18)),
                      Text('Weight: ' + _homeVm.peopleList![index].mass!,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18)),
                    ],
                  ),
                ),
              );
            },
          ),
        );
}
