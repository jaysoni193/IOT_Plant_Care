
import 'dart:convert';
import 'package:Iot_Plant_Care/constants.dart';
import 'package:Iot_Plant_Care/ui/screens/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:http/http.dart' as http;

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController forgotPass = TextEditingController();
  bool verifyButton = false;
  late var verifyLink;
  Future checkUser() async{
    var forgot = "http://192.168.29.127/UserApi/check.php";
    var response = await http.post(Uri.parse(forgot), body: {
      "username" : forgotPass.text,
    });
    var link = json.decode(response.body);
    if(link == "InvalidUser"){
      Fluttertoast.showToast(
        msg: 'There have no user in database',
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Constants.primaryColor,
        textColor: Colors.white,
        gravity: ToastGravity.BOTTOM,
        fontSize: 16.0,
      );
    }
    else{
      setState(() {
        verifyLink = link;
        verifyButton = true;
      });
      Fluttertoast.showToast(
        msg: 'Click The Verify Button to Change The Password',
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Constants.primaryColor,
        textColor: Colors.white,
        gravity: ToastGravity.BOTTOM,
        fontSize: 16.0,
      );
    }
    print(link);
  }
  int newPass = 0;
  Future resetPassword() async{
    var response = await http.post(verifyLink);
    var link = json.decode(response.body);
    setState(() {
      newPass  = link;
    });
    Fluttertoast.showToast(
      msg: 'Your Password has been reset: $newPass',
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: Constants.primaryColor,
      textColor: Colors.white,
      gravity: ToastGravity.BOTTOM,
      fontSize: 16.0,
    );

  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/images/reset.png'),
              const Text(
                'Forgot Password',
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
               TextField(
                 controller: forgotPass,
                 decoration: InputDecoration(
                   border: InputBorder.none,
                   hintText: 'Enter Email',
                   prefixIcon: Icon(color: Constants.primaryColor.withOpacity(.85),
                     Icons.alternate_email,
                   ),
                 ),
                 cursorColor: Constants.blackColor.withOpacity(.50),
              ),

              GestureDetector(
                onTap: () {
                  checkUser();
                },
                child: Container(
                  width: size.width,
                  height: 65,
                  decoration: BoxDecoration(
                    color: Constants.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: const Center(
                    child: Text(
                      'Reset Password',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ),
              verifyButton ? MaterialButton(
                color: Constants.primaryColor,
                onPressed: () {
                  resetPassword();
              },
                child: Text('Verify'),
              ) : Container(),
               SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          child: const SignIn(),
                          type: PageTransitionType.bottomToTop));
                },
                child: Center(
                  child: Text.rich(
                      TextSpan(
                          children: [
                            TextSpan(
                              text: 'Have an Account?',

                              style: TextStyle(
                                color: Constants.blackColor,
                              ),
                            ),
                            TextSpan(
                              text: 'Login',
                              style: TextStyle(
                                color: Constants.primaryColor,
                              ),
                            ),
                          ]
                      )
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

