import 'dart:async';
import 'package:Iot_Plant_Care/constants.dart';
import 'package:Iot_Plant_Care/ui/screens/favorite_page.dart';
import 'package:Iot_Plant_Care/ui/screens/profile_page.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  bool switchValue = false;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      
        child: SingleChildScrollView(
          child: Column(
      children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Constants.primaryColor,
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 70,
                    height: 70,
                    margin: EdgeInsets.only(top: 30),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/user.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Text(
                    'Jay Soni',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'test@gmail.com',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: Text(
              'Personalization',
              style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
            ),
          ),   //Personalization
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text(
              'Notification',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const VoiceAssistant()),
              // );
            },
            trailing: ClipOval(
              child: Container(
                color: Colors.blue,
                width: 20,
                height: 20,
                child: Center(
                  child: Text(
                    '3',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),

          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text(
              'Share',
              style: TextStyle(fontSize: 18),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const VoiceAssistant()),
              // );
            },
          ),
          Divider(
            height: 1,
            thickness: 1,
            indent: 5,
            endIndent: 5,
            color: Colors.grey,
          ),  //Personalization
          ListTile(
            title: Text(
              'Setting',
              style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
            ),
          ),  //Settings
          ListTile(
            leading: Icon(Icons.language),
            title: Text(
              'Language',
              style: TextStyle(fontSize: 18),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const VoiceAssistant()),
              // );
            },
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text(
              'Location',
              style: TextStyle(fontSize: 18),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const VoiceAssistant()),
              // );
            },
          ),
          ListTile(
            leading: Icon(Icons.dark_mode),
            title: Text(
              'Dark Mode',
              style: TextStyle(fontSize: 18),
            ),
            trailing: Switch(
              value: switchValue,
              onChanged: (value){
                setState(() {
                  switchValue = value;
                });
              },
            ),
          ),
          Divider(
            height: 1,
            thickness: 1,
            indent: 5,
            endIndent: 5,
            color: Colors.grey,
          ), //Settings
          ListTile(
            title: Text(
              'Help & Support',
              style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
            ),
          ),   // Help & Support
          ListTile(
            leading: Icon(Icons.headset_mic_rounded),
            title: Text(
              'Get Help',
              style: TextStyle(fontSize: 18),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const VoiceAssistant()),
              // );
            },
          ),
          ListTile(
            leading: Icon(Icons.message_rounded),
            title: Text(
              'FAQ',
              style: TextStyle(fontSize: 18),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const VoiceAssistant()),
              // );
            },
          ),
          Divider(
            height: 1,
            thickness: 1,
            indent: 5,
            endIndent: 5,
            color: Colors.grey,
          ),   // Help & Support
          ListTile(
            leading: Icon(Icons.logout,color: Colors.red,),
            title: Text(
              'Logout',
              style: TextStyle(fontSize: 18,color: Colors.red),
            ),
            onTap: (){
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const VoiceAssistant()),
              // );
            },
          ), //logout
          Divider(
            height: 1,
            thickness: 1,
            indent: 5,
            endIndent: 5,
            color: Colors.grey,
          ),
      ],
    ),
        ));
  }
}
