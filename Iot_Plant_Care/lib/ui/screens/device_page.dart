import 'dart:async';
import 'dart:convert';
import 'package:Iot_Plant_Care/constants.dart';
import 'package:Iot_Plant_Care/models/device_model.dart';
import 'package:Iot_Plant_Care/ui/screens/favorite_page.dart';
import 'package:Iot_Plant_Care/ui/screens/generate_charts.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// First UI
class DevicePage extends StatefulWidget {
  const DevicePage({Key? key}) : super(key: key);
  @override
  State<DevicePage> createState() => _DevicePageState();
}
class _DevicePageState extends State<DevicePage> {
  // Internet Connecivity
  late ConnectivityResult result;
  late StreamSubscription subscription;
  var isConnected = false;

  @override
  void initState() {
    super.initState();
    startStreaming();
    Timer.periodic(Duration(seconds: 3), (timer) {
      getDataFromDevice();
    });
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
  // Internet Connecivity
  //create stream
  StreamController<DataModel> _streamController = StreamController();
  @override
  void dispose() {
    // stop streaming when app close
    _streamController.close();
  }
  // @override
  // void initState() async {
  //   // TODO: implement initState
  //   super.initState();
  //   // A Timer method that run every 3 seconds
  //   Timer.periodic(Duration(seconds: 3), (timer) {
  //     getDataFromDevice();
  //   });
  // }
  Future<void> getDataFromDevice() async {
    // var url = "https://iotplantcare.000webhostapp.com/UserAPI/device.php";
    var url = "http://192.168.29.127/UserApi/device.php";
    //var url = "http://192.168.177.59/UserApi/device.php";
    final response = await http.get(Uri.parse(url));
    final databody = json.decode(response.body).last;
    DataModel dataModel = new DataModel.fromJson(databody);
    _streamController.sink.add(dataModel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder<DataModel>(
          stream: _streamController.stream,
          builder: (context, snapdata) {
            switch (snapdata.connectionState) {
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
              default:
                if (snapdata.hasError) {
                  return Text('Please Wait....');
                } else {
                  return BuildDeviceWidget(snapdata.data!);
                }
            }
          },
        ),
      ),
    );
  }

  Widget BuildDeviceWidget(DataModel dataModel) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Plant Mositure
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.12,
              margin: EdgeInsets.symmetric(
                vertical: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade900,
                    offset: Offset(1, 2),
                    blurRadius: 3,
                    spreadRadius: 1,
                  )
                ],
              ),
              child: Row(
                children: [
                  Image.asset('assets/images/mositure.png', height: 80, width: 100),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Plant Mositure: ${dataModel.mositure} %',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            // Tempreture
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.12,
              margin: EdgeInsets.symmetric(
                vertical: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade900,
                    offset: Offset(1, 2),
                    blurRadius: 3,
                    spreadRadius: 1,
                  )
                ],
              ),
              child: Row(
                children: [
                  Image.asset('assets/images/thermo.png', height: 80, width: 80),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Temperature: ${dataModel.temperature} ºC',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            // Humidity
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.12,
              margin: EdgeInsets.symmetric(
                vertical: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade900,
                    offset: Offset(1, 2),
                    blurRadius: 3,
                    spreadRadius: 1,
                  )
                ],
              ),
              child: Row(
                children: [
                  Image.asset('assets/images/humidity.png', height: 80, width: 100),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Humidity: ${dataModel.humidity} %',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
           SizedBox(
             height: 50,
           ),
           Center(
             child: Material(
               color: Constants.primaryColor,
               borderRadius: BorderRadius.circular(8),
               child: InkWell(
                 onTap: () async {
                   Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) => DataGraph()),
                   );
                 },
                 borderRadius: BorderRadius.circular(32),
                 child:const Padding(
                   padding:  EdgeInsets.symmetric(
                     horizontal: 30,
                     vertical: 12,
                   ),
                   child: Text(
                     "Show Graph",
                     style: TextStyle(
                       color: Colors.white,
                       fontSize: 16,
                     ),
                   ),
                 ),
               ),
             ),
           )
          ],

        ),
      ),

    );
  }
}


