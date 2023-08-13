// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'dart:io';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:tflite/tflite.dart';
//
// class ScanPage extends StatefulWidget {
//   const ScanPage({Key? key}) : super(key: key);
//
//   @override
//   State<ScanPage> createState() => _ScanPageState();
// }
//
// class _ScanPageState extends State<ScanPage> {
//  // var getResult = 'Result';
//
//   Future<File>? imageFile;
//   File? _image;
//   String result = '';
//   ImagePicker? imagePicker;
//
//   selectPhotoFromGallery() async {
//     XFile? pickFile = await imagePicker!.pickImage(source: ImageSource.gallery);
//     _image = File(pickFile!.path);
//     setState(() {
//       _image;
//       doImageClassification();
//     });
//   }
//
//   capturePhotoFromCamara() async {
//     XFile? pickFile = await imagePicker!.pickImage(source: ImageSource.camera);
//     _image = File(pickFile!.path);
//     setState(() {
//       _image;
//       doImageClassification();
//     });
//   }
//
//   loadDataModelFiles() async {
//     String? output = await Tflite.loadModel(
//         model: 'assets/model_unquant.tflite',
//         labels: 'assets/labels.txt',
//         numThreads: 1,
//         isAsset: true,
//         useGpuDelegate: false);
//     print(output);
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     imagePicker = ImagePicker();
//     loadDataModelFiles();
//   }
//
//   doImageClassification() async {
//     var recognitions = await Tflite.runModelOnImage(path:
//     _image!.path,
//       imageMean: 0.0,
//       imageStd: 255.0,
//       numResults: 2, // 2 results per image - prediction
//       threshold: 0.1,
//       asynch: true,
//     );
//     print(recognitions!.length.toString());
//     setState(() {
//       result = '';
//     });
//     recognitions.forEach((element) { setState(() {
//       print(element.toString());
//       result += element['label'] + '\n\n';
//     });});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
// //new
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//             image: DecorationImage(image: AssetImage('path'),
//                 fit: BoxFit.cover)
//         ),
//         child:  Column(
//           children: [
//             const SizedBox(width: 100.0,),
//             Container(
//               margin: EdgeInsets.only(top: 20.0),
//               child: Stack(
//                 children: <Widget>[
//                   Center(
//                     child: TextButton(
//                       onPressed: selectPhotoFromGallery,
//                       onLongPress: capturePhotoFromCamara,
//                       child: Container(
//                           margin: const EdgeInsets.only(top: 30.0,right: 35.0,left: 18.0),
//                           child: _image!= null
//                               ?
//                           Image.file(
//                             _image!,
//                             height: 360.0,
//                             width: 400.0,
//                             fit: BoxFit.cover,
//                           ):Container(
//                             width: 140.0,
//                             height: 190.0,
//                             child: Icon(
//                               Icons.camera_alt_sharp,
//                               color: Colors.black,
//
//                             ),
//                           )
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             const SizedBox(height: 160.0,),
//             Container(
//               margin: const EdgeInsets.only(top: 20.0),
//               child: Text(
//                 '$result',
//                 textAlign: TextAlign.center,
//                 style: const TextStyle(
//                   fontSize: 40.0,
//                   color: Colors.purpleAccent,
//                   backgroundColor: Colors.white,
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// //old
//     //
// //     return Scaffold(
// //       body: Stack(
// //         children: [
// //           Positioned(
// //             top: 50,
// //             left: 20,
// //             right: 20,
// //             child: Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //               children: [
// //                 GestureDetector(
// //                   onTap: () {
// //                     Navigator.pop(context);
// //                   },
// //                   child: Container(
// //                     height: 40,
// //                     width: 40,
// //                     decoration: BoxDecoration(
// //                       borderRadius: BorderRadius.circular(25),
// //                       color: Constants.primaryColor.withOpacity(.10),
// //                     ),
// //                     child: Icon(
// //                       Icons.close,
// //                       color: Constants.primaryColor,
// //                     ),
// //                   ),
// //                 ),
// //                 GestureDetector(
// //                   onTap: () {
// //                     debugPrint('favorite');
// //                   },
// //                   child: Container(
// //                     height: 40,
// //                     width: 40,
// //                     decoration: BoxDecoration(
// //                       borderRadius: BorderRadius.circular(25),
// //                       color: Constants.primaryColor.withOpacity(.10),
// //                     ),
// //                     child: IconButton(
// //                       onPressed: () {},
// //                       icon: Icon(
// //                         Icons.share,
// //                         color: Constants.primaryColor,
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //           Positioned(
// //             top: 100,
// //             right: 20,
// //             left: 20,
// //             child: Container(
// //               width: size.width * .8,
// //               height: size.height * .8,
// //               padding: const EdgeInsets.all(20),
// //               child: Center(
// //                 child: Column(
// //                   mainAxisAlignment: MainAxisAlignment.center,
// //                   crossAxisAlignment: CrossAxisAlignment.center,
// //                   children: [
// //                     Image.asset(
// //                       'assets/images/plantscan.png',
// //                       height: 100,
// //                     ),
// //                 GestureDetector(
// //                   onTap: () {
// //                     Scan();
// //                   },
// //                   child: Container(
// //                     width: size.width,
// //                     height: 50,
// //                     decoration: BoxDecoration(
// //                       color: Constants.primaryColor,
// //                       borderRadius: BorderRadius.circular(10),
// //                     ),
// //                     padding:
// //                     const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
// //                     child: const Center(
// //                       child: Text(
// //                         'Scan',
// //                         style: TextStyle(
// //                           color: Colors.white,
// //                           fontSize: 18.0,
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //                     SizedBox(
// //                       height: 20.0,
// //                     ),
// //                     Text(getResult),
// //
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   void Scan() async {
// //     try {
// //       final qrCode = await FlutterBarcodeScanner.scanBarcode(
// //           '#ff6666', 'Cancel', true, ScanMode.QR);
// //
// //       if (!mounted) return;
// //
// //       setState(() {
// //         var getResult = qrCode;
// //       });
// //       print("QRCode_Result:--");
// //       print(qrCode);
// //     } on PlatformException {
// //       var getResult = 'Failed to scan QR Code.';
// //     }
// //   }
// // }
