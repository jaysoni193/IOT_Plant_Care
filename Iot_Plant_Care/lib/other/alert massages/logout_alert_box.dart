// import 'package:flutter/material.dart';
// enum DialogsAction {yes, cancel}
//
//  class AlertDilogs {
//   static Future<DialogsAction> yesCancelDialog(
//       BuildContext context,
//       String titel,
//       String body,) async {
//     final action  = await showDialog(context: context,
//         builder: (BuildContext context){
//       return AlertDialog(
//         title: Text(titel),
//       );
//     });
//   }
// }
// showAlertDialog(BuildContext context) {
//   // set up the buttons
//   Widget cancelButton = FlatButton(
//     child: Text("Cancel"),
//     onPressed:  () {},
//   );
//   Widget continueButton = FlatButton(
//     child: Text("Continue"),
//     onPressed:  () {},
//   );
//   // set up the AlertDialog
//   AlertDialog alert = AlertDialog(
//     title: Text("AlertDialog"),
//     content: Text("Would you like to continue learning how to use Flutter alerts?"),
//     actions: [
//       cancelButton,
//       continueButton,
//     ],
//   );
//   // show the dialog
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return alert;
//     },
//   );
// }