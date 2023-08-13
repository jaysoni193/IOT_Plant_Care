import 'dart:async';
import 'dart:convert';
import 'package:Iot_Plant_Care/constants.dart';
import 'package:Iot_Plant_Care/ui/screens/forgot_password.dart';
import 'package:Iot_Plant_Care/ui/screens/root_page.dart';
import 'package:Iot_Plant_Care/ui/screens/signup_page.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  var isChecked = true;
  bool obscuredText = true;
  var formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late SharedPreferences logindata;
  late bool newuser;
  //Check Internet Connectivity
  late ConnectivityResult result;
  late StreamSubscription subscription;
  var isConnected = false;
  @override
  void initState(){
    super.initState();
    startStreaming();
    check_if_already_login();
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
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   check_if_already_login();
  // }
  void check_if_already_login() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? true);
    print(newuser);
    if (newuser == false) {
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => RootPage()));
    }
  }
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  // Call Login Method
  Future login() async {
    var loginurl = "http://192.168.29.127/UserApi/login1.php";
    // var loginurl = "http://192.168.177.59/UserApi/login1.php";
    var response = await http.post(Uri.parse(loginurl), body: {
      "email": emailController.text,
      "password": passwordController.text,
    });
    var data = json.decode(response.body);
    if (data.toString() == "Success") {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString('email', emailController.text);
      Fluttertoast.showToast(
        msg: 'Login Successful',
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Constants.primaryColor,
        textColor: Colors.white,
        gravity: ToastGravity.BOTTOM,
        fontSize: 16.0,
      );
      logindata.setBool('login', false);
      logindata.setString('email', emailController.text);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RootPage(),
        ),
      );
    } else {
      Fluttertoast.showToast(
        backgroundColor: Colors.redAccent,
        textColor: Colors.white,
        msg: 'Username and password invalid',
        toastLength: Toast.LENGTH_SHORT,
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/images/login.png'),
              Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: emailController,
                validator: (value) => value == "" ? "Please write Email" : null,
                obscureText: false,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter Email',
                  prefixIcon: Icon(
                    color: Constants.primaryColor.withOpacity(.85),
                    Icons.person,
                  ),
                ),
                cursorColor: Constants.blackColor.withOpacity(.50),
              ),
              TextFormField(
                controller: passwordController,
                validator: (val) => val == "" ? "Please write Password" : null,
                obscureText: obscuredText,
                // Password Like (1234....)
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter Password',
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
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {
                  login();
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
                      'Sign In ',
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
                          child: const ForgotPassword(),
                          type: PageTransitionType.bottomToTop));
                },
                child: Center(
                  child: Text.rich(TextSpan(children: [
                    TextSpan(
                      text: 'Forgot Password?',
                      style: TextStyle(
                        color: Constants.blackColor,
                      ),
                    ),
                    TextSpan(
                      text: 'Reset Here',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Constants.primaryColor,
                      ),
                    ),
                  ])),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: const [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text('OR'),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          child: const SignUp(),
                          type: PageTransitionType.bottomToTop));
                },
                child: Center(
                  child: Text.rich(TextSpan(children: [
                    TextSpan(
                      text: 'New to This App?',
                      style: TextStyle(
                        color: Constants.blackColor,
                      ),
                    ),
                    TextSpan(
                      text: 'Register',
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
}
