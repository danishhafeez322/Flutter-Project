// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// import '../core/constant/app_color.dart';




// class MyImagePicker extends  StatefulWidget {
//   @override
//   State<MyImagePicker> createState() => _HomeState();
// }

// class _HomeState extends State<MyImagePicker> {

//   final ImagePicker imgpicker = ImagePicker();
//   List<XFile>? imagefiles;

//   openImages() async {
// try {
//     var pickedfiles = await imgpicker.pickMultiImage();
//     //you can use ImageCourse.camera for Camera capture
//     if(pickedfiles != null){
//         imagefiles = pickedfiles;
//         setState(() {
//         });
//     }else{
//         print("No image is selected.");
//     }
// }catch (e) {
//     print("error while picking file.");
// }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//              alignment: Alignment.center,
//              padding: EdgeInsets.all(20),
//              child: Column(
//                children: [

//                   //open button ----------------
//                   ElevatedButton.icon(
//                     icon: Icon(
//                       Icons.upload,
//                       color: Colors.white,
//                       size: 30.0,
//                     ),
//                     label: Text('Choose Images'),
//                     onPressed: () {
//                       openImages();
//                     },
//                     style: ButtonStyle(
//                       backgroundColor: MaterialStateProperty.all<Color>(AppColors.uploadColor),
//                     ),
//                   ),
//                   Divider(),
//                   Text("Picked Files:"),
//                   Divider(),

//                   imagefiles != null?Wrap(
//                      children: imagefiles!.map((imageone){
//                         return Container(
//                            child:Card( 
//                               child: Container(
//                                  height: 100, width:100,
//                                  child: Image.file(File(imageone.path)),
//                               ),
//                            )
//                         );
//                      }).toList(),
//                   ):Container()
//                ],
//              ),
//           );
//   }
// }

