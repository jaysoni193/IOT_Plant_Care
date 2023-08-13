import 'dart:convert';
import 'package:Iot_Plant_Care/constants.dart';
import 'package:Iot_Plant_Care/ui/screens/root_page.dart';
import 'package:Iot_Plant_Care/ui/screens/signin_page.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool obscuredText = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 45),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/images/Signup.png'),
              const Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter Name',
                  prefixIcon: Icon(
                    color: Constants.primaryColor.withOpacity(.85),
                    Icons.person,
                  ),
                ),
                cursorColor: Constants.blackColor.withOpacity(.50),
              ), //username
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter Email',
                  prefixIcon: Icon(
                    color: Constants.primaryColor.withOpacity(.85),
                    Icons.alternate_email,
                  ),
                ),
                cursorColor: Constants.blackColor.withOpacity(.50),
              ), //Email
              TextField(
                controller: phoneController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter Phone.No',
                  prefixIcon: Icon(
                    color: Constants.primaryColor.withOpacity(.85),
                    Icons.call,
                  ),
                ),
                cursorColor: Constants.blackColor.withOpacity(.50),
              ), //Address
              TextField(
                controller: passwordController,
                obscureText: obscuredText,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Password',
                  prefixIcon: Icon(
                    color: Constants.primaryColor.withOpacity(.85),
                    Icons.lock,
                  ),
                  suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          obscuredText = !obscuredText;
                        });
                      },
                      child: obscuredText
                          ? Icon(
                        Icons.visibility_off,
                        color: Colors.grey,
                      )
                          : Icon(
                        Icons.visibility,
                        color: Colors.grey,
                      )),
                ),
                cursorColor: Constants.blackColor.withOpacity(.50),
              ),
              SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () {
                  Registration();
                },
                child: Container(
                  width: size.width,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Constants.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: const Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 15,
              ),

              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          child: const SignIn(),
                          type: PageTransitionType.bottomToTop));
                },
                child: Center(
                  child: Text.rich(TextSpan(children: [
                    TextSpan(
                      text: 'Have an Account?',
                      style: TextStyle(
                        color: Constants.blackColor,
                      ),
                    ),
                    TextSpan(
                      text: 'Login',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Constants.primaryColor,
                      ),
                    ),
                  ])),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Call Registration Method
  Future Registration() async {
    if (nameController.text == "" ||
        emailController.text == "" ||
        phoneController.text == "" ||
        passwordController.text == "") {
      Fluttertoast.showToast(
        msg: "Fileds cannot be blank!!",
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Constants.primaryColor,
        textColor: Colors.white,
        gravity: ToastGravity.BOTTOM,
        fontSize: 16.0,
      );
    } else {
       //var regAPIUrl = "http://192.168.29.127/UserApi/registration.php";
      var regAPIUrl = "http://192.168.29.127/UserApi/registration.php";
      Map maped = {
        'name': nameController.text,
        'email': emailController.text,
        'phone': phoneController.text,
        'password': passwordController.text
      };
      http.Response response =
      await http.post(Uri.parse(regAPIUrl), body: maped);
      var data = jsonDecode(response.body);
      Fluttertoast.showToast(
        msg: "Welcome "  + nameController.text,
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Constants.primaryColor,
        textColor: Colors.white,
        gravity: ToastGravity.BOTTOM,
        fontSize: 16.0,
      );
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (builder) => RootPage()));
      print("Data: ${data}");
    }
  }
}
