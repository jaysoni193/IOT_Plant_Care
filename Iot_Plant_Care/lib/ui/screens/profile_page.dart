import 'package:Iot_Plant_Care/constants.dart';
import 'package:Iot_Plant_Care/ui/screens/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}
class _ProfilePageState extends State<ProfilePage> {
  Widget userInfoItemProfile(IconData iconData, String userData) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Icon(
            iconData,
            size: 30,
            color: Colors.white,
          ),
          SizedBox(width: 16,),
          Text(
            userData,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
    );
  }
  late SharedPreferences logindata;
  late String email;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initial();
  }
  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      email = logindata.getString('email')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(32),
      children: [
        Center(
          child: Image.asset('assets/images/user.png'),
        ),
        const SizedBox(
          height: 20,
        ),

        userInfoItemProfile(Icons.email, "$email"),
        SizedBox(height: 20,),
        Center(
          child: Material(
            color: Constants.primaryColor,
            borderRadius: BorderRadius.circular(8),
            child: InkWell(
              onTap: () async {
                logindata.setBool('login', true);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=>SignIn()));
              },
              borderRadius: BorderRadius.circular(32),
              child:const Padding(
                padding:  EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 12,
                ),
                child: Text(
                  "Sign Out",
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
    );
  }
}
