import 'dart:async';
import 'package:Iot_Plant_Care/constants.dart';
import 'package:Iot_Plant_Care/models/plants.dart';
import 'package:Iot_Plant_Care/other/Drawer/main_drawer.dart';
import 'package:Iot_Plant_Care/ui/screens/device_page.dart';
import 'package:Iot_Plant_Care/ui/screens/favorite_page.dart';
import 'package:Iot_Plant_Care/ui/screens/home_page.dart';
import 'package:Iot_Plant_Care/ui/screens/profile_page.dart';
import 'package:Iot_Plant_Care/ui/screens/scan_page.dart';
import 'package:Iot_Plant_Care/ui/screens/voice_assistant_page.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  //Check Internet Connectivity
  late ConnectivityResult result;
  late StreamSubscription subscription;
  var isConnected = false;

  @override
  void initState() {
    super.initState();
    startStreaming();
  }

  checkInternet() async {
    result = await Connectivity().checkConnectivity();
    if (result != ConnectivityResult.none) {
      isConnected = true;
    } else {
      isConnected = false;
      showDialogBox();
    }
    setState(() {});
  }

  showDialogBox() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text("No Internet"),
        content: Text("Please check your internet connection"),
        actions: [
          CupertinoButton.filled(
            child: Text("Retry"),
            onPressed: () {
              Navigator.pop(context);
              checkInternet();
            },
          )
        ],
      ),
    );
  }

  startStreaming() {
    subscription = Connectivity().onConnectivityChanged.listen((event) async {
      checkInternet();
    });
  }

  //Check Internet Connectivity
  List<Plant> favorites = [];
  int _bottomNavIndex = 0;

  //List of the pages
  List<Widget> _widgetOptions() {
    return [
      HomePage(),
      FavoritePage(
        favoritePlants: favorites,
      ),
      DevicePage(),
      ProfilePage(),
      //ScanPage(),
    ];
  }

  //List of the pages icons
  List<IconData> iconList = [
    Icons.home,
    Icons.favorite,
    Icons.device_thermostat_outlined,
    Icons.person,
  ];

  //List of the pages Titles
  List<String> titleList = [
    'Home',
    'Favorite',
    'Device',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 75),
          child: Center(
            child: Row(
              children: [
                Text(
                  titleList[_bottomNavIndex],
                  style: TextStyle(
                    color: Colors.white,
                    // color: Constants.primaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const VoiceAssistant()),
                    );
                  },
                  icon: Icon(Icons.keyboard_voice_sharp),)
              ],
            ),
          ),
        ),
        backgroundColor: Constants.primaryColor,
        //backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 10.0,
      ),
      drawer: MainDrawer(),
      body: IndexedStack(
        // Body hold the  Pages  Widget
        index: _bottomNavIndex,
        children: _widgetOptions(),
      ),
      floatingActionButton: FloatingActionButton(
        //Plant Scan button
        onPressed: () {
          // Navigator.push(
          //     context,
          //     PageTransition(
          //         child: const ScanPage(),
          //         type: PageTransitionType.bottomToTop));
        },
        child: Image.asset(
          'assets/images/camara.png',
          height: 650,
        ),
        backgroundColor: Constants.primaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        //bottom navigation bar
        backgroundColor: Constants.primaryColor,
        // splashColor: Constants.primaryColor,
        splashColor: Colors.white,
        activeColor: Colors.black,
        // activeColor: Constants.primaryColor,
        //inactiveColor: Colors.black.withOpacity(.5),
        inactiveColor: Colors.grey.shade100,
        icons: iconList,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index) {
          //   On tap function for Bottom nav Bar
          setState(() {
            _bottomNavIndex = index;
            final List<Plant> favoritedPlants = Plant.getFavoritedPlants();
            favorites = favoritedPlants;
          });
        },
      ),
    );
  }
}
