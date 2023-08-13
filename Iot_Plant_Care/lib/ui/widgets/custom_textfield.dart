//
//
// import 'package:flutter/material.dart';
// import 'package:plant_care/constants.dart';
//
// class CustomTextfield extends StatelessWidget  {
//   final IconData icon;
//   final bool obscreText;
//   final String hintText;
//
//   const CustomTextfield({
//     Key? key, required this.icon, required this.obscreText, required this.hintText, required TextEditingController controller,
//   }) : super(key: key);
//
//
//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       obscureText: false,
//       style: TextStyle(
//         color:  Constants.blackColor,
//       ),
//       decoration: InputDecoration(
//         border: InputBorder.none,
//         prefixIcon: Icon(icon,color: Constants.blackColor.withOpacity(.3),),
//         hintText: hintText,
//       ),
//       cursorColor: Constants.blackColor.withOpacity(.5),
//     );
//   }
// }
