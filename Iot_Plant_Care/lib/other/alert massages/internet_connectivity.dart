import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConnectionChecker extends StatefulWidget {
  const ConnectionChecker({Key? key}) : super(key: key);

  @override
  State<ConnectionChecker> createState() => _ConnectionCheckerState();
}

class _ConnectionCheckerState extends State<ConnectionChecker> {
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(


    );
  }
}