import 'package:animate_do/animate_do.dart';
import 'package:challenge_ubertrack/pages/invaders_details/invaders_details_page.dart';
import 'package:challenge_ubertrack/widgets/background_image.dart';
import 'package:challenge_ubertrack/widgets/custom_app_bar.dart';
import 'package:challenge_ubertrack/widgets/custom_loading_spinner.dart';
import 'package:challenge_ubertrack/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'home_page_view_model.dart';

class HomePage extends StatefulWidget {
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

    final _size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          appBar: CustomAppBar(
            titulo: 'List of threats',
            automaticallyImplyLeading: false,
            leading: Builder(
              builder: (context) => IconButton(
                color: Colors.white,
                icon: const Icon(Icons.menu),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
          ),
          drawer: SideBarWidget(),
          body: BackgroundWidget(
            child: Center(
              child: _homeVm.isPageLoaded == true
                  ? FadeInUp(
                      child: Column(
                      children: [
                        SizedBox(height: _size.height * 0.025),
                        Expanded(child: starWarsPeople(context)),
                        SizedBox(height: _size.height * 0.025),
                      ],
                    ))
                  : CustomLoadingSpinner(),
            ),
          )),
    );
  }
}

Widget starWarsPeople(BuildContext context) {
  final _homeVm = Provider.of<HomePageViewModel>(context, listen: false);

  return _homeVm.peopleList?.length == 0
      ? Text('No hay invasores')
      : Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _homeVm.peopleList?.length,
                shrinkWrap: false,
                itemBuilder: (context, index) {
                  return Opacity(
                    opacity: 0.95,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: Colors.grey[900],
                      child: ListTile(
                        onTap: () {
                          Get.to(() => InvadersDetailsPage(
                              selectedPeople: _homeVm.peopleList![index]));
                        },
                        title: Text(
                            _homeVm.peopleList![index].name!.toUpperCase(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20)),
                        subtitle: Text(
                            'Height: ' +
                                _homeVm.peopleList![index].height! +
                                'cm',
                            style: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                                'Gender: ' + _homeVm.peopleList![index].gender!,
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18)),
                            Text(
                                'Weight: ' +
                                    _homeVm.peopleList![index].mass! +
                                    'kg',
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18)),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
}
