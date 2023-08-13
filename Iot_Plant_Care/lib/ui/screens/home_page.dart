import 'dart:async';
import 'package:Iot_Plant_Care/constants.dart';
import 'package:Iot_Plant_Care/models/plants.dart';
import 'package:Iot_Plant_Care/ui/screens/detail_page.dart';
import 'package:Iot_Plant_Care/ui/widgets/plant_widgets.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Check Internet Connectivity
  late ConnectivityResult result;
  late StreamSubscription subscription;
  var isConnected = false;
  @override
  void initState(){
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
    setState(() {
    });
  }
  showDialogBox() {
    showDialog(
      barrierDismissible: false,
      context: context, builder: (context) =>
        CupertinoAlertDialog(
          title: Text("No Internet"),
          content:Text("Please check your internet connection"),
          actions: [
            CupertinoButton.filled(child: Text("Retry"), onPressed: () {
              Navigator.pop(context);
              checkInternet();
            },)
          ],
        ),);
  }
  startStreaming(){
    subscription = Connectivity().onConnectivityChanged.listen((event) async{
      checkInternet();
    });
  }
  //Check Internet Connectivity

  // Future getPlantData() async {
  //   var url = 'http://192.168.29.127/UserApi/plantData.php';
  //   //var url = 'https://iotplantcare.000webhostapp.com/UserAPI/plantData.php';
  //   var respose = await http.get(Uri.parse(url));
  //   return json.decode(respose.body);
  // }
  // Future<List<Plant>> getPlantData() async{
  //   final String fechPlantData = 'http://192.168.29.127/UserApi/plantData.php';
  //   Response response = await get(Uri.parse(fechPlantData));
  //   if (response.statuscode == 200)
  //     {
  //        List<dynamic> body = jsonDecode(response.body);
  //        List<Plant> _plantList = body
  //        .map((dynamic item) => Plant.fromJSON(item),)
  //        .toList();
  //        return _plantList;
  //     }
  //   else{
  //     throw " Unable to retrive the plants Data";
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //List<Plant> _plantList = [];
    List<Plant> _plantList = Plant.plantList;
    bool toggelIsFavorated(bool isFavrited) {
      return !isFavrited;
    }
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // Code for Search Bar
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ),
                      width: size.width * .9,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search,
                            color: Colors.black54.withOpacity(.6),
                          ),
                          const Expanded(
                              child: TextField(
                                showCursor: false,
                                decoration: InputDecoration(
                                  hintText: 'Search Plant',
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                              )),
                          Icon(
                            Icons.mic,
                            color: Colors.black54.withOpacity(.6),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Constants.primaryColor.withOpacity(.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 25,),
              SizedBox(
                height: size.height * .3,
                child: ListView.builder(
                  itemCount: _plantList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: DetailPage(
                                  plantId: _plantList[index].plantId,
                                ),
                                type: PageTransitionType.bottomToTop));
                      },
                      child: Container(
                        width: 200,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 10,
                              right: 20,
                              child: Container(
                                height: 50,
                                width: 50,
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      bool isFavorited = toggelIsFavorated(
                                          _plantList[index].isFavorated);
                                      _plantList[index].isFavorated = isFavorited;
                                    });
                                  },
                                  icon: Icon(
                                    _plantList[index].isFavorated == true
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: Constants.primaryColor,
                                  ),
                                  iconSize: 30,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 50,
                              right: 50,
                              bottom: 50,
                              top: 50,
                              child: Image.asset(_plantList[index].imageURL),
                            ),
                            Positioned(
                              bottom: 15,
                              left: 20,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _plantList[index].plantName,
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 15,
                              right: 20,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 2),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),

                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Constants.primaryColor.withOpacity(.8),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 16, bottom: 20, top: 20),
                child: const Text(
                  'New Plants',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ),
              Container(
                //New Plants List
                padding: const EdgeInsets.symmetric(horizontal: 12),
                height: size.height * .5,
                child: ListView.builder(
                    itemCount: _plantList.length,
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return PlantWidget(index: index, plantList: _plantList);
                    }),
              ),
            ],
          ),
        ));
  }}
