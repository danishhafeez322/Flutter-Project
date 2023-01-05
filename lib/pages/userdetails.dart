// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:mad_project/main.dart';
// import 'package:mad_project/widgets/themebutton.dart';

// import 'categorybottombar.dart';

// class UserDetails extends StatefulWidget {
//   int days = 1;
//   double cost = 0.0;
//   String category;

//   UserDetails(
//       {Key? key,
//       required this.days,
//       required this.category,
//       required this.cost})
//       : super(key: key);

//   UserDetailsState createState() => UserDetailsState();
// }

// class UserDetailsState extends State<UserDetails> {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   bool _validate = false;
//   bool _validate1 = false;
//   @override
//   Widget build(Object context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         title: const Text(
//           "Rent it",
//           style: TextStyle(
//               fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black54),
//         ),
//         backgroundColor: Colors.white54,
//         elevation: 0.0,
//         iconTheme: const IconThemeData(color: Colors.black54),
//         actions: [
//           Container(
//             padding: const EdgeInsets.all(10),
//             margin: const EdgeInsets.only(right: 5),
//             child: ClipOval(
//               child: Image.asset("assets/images/danish.jpeg"),
//             ),
//           ),
//         ],
//       ),
//       body: Container(
//         child: Stack(children: [
//           Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 20),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: const [
//                     Text("Add details to Proceed",
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20,
//                             color: Colors.redAccent)),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 child: Container(
//                   padding: const EdgeInsets.only(top: 80, right: 20, left: 20),
//                   margin: const EdgeInsets.all(10),
//                   child: Center(
//                     child: Column(
//                       children: [
//                         TextField(
//                           controller: nameController,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(50)),
//                             // labelText: 'Your Name',
//                             hintText: 'Enter Your Name',
//                             errorText:
//                                 _validate ? 'Value can\'t be empty' : null,
//                             prefixIcon: const Icon(Icons.person_pin_sharp),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 15,
//                         ),
//                         TextField(
//                           maxLines: 1,
//                           controller: emailController,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(50),
//                             ),
//                             //labelText: 'Email',
//                             hintText: 'Enter Your email',
//                             errorText:
//                                 _validate1 ? 'Enter a valid email' : null,
//                             prefixIcon: const Icon(Icons.mail_outlined),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 15,
//                         ),
//                         ThemeButton(
//                             label: 'Proceed',
//                             onClick: () {
//                               setState(() {
//                                 nameController.text.isEmpty
//                                     ? _validate = true
//                                     : _validate = false;

//                                 emailController.text.isEmpty ||
//                                         !emailController.text.contains("@")
//                                     ? _validate1 = true
//                                     : _validate1 = false;
//                                 if (!_validate && !_validate1) {
//                                   showDialog(
//                                       context: this.context,
//                                       builder: (BuildContext context) {
//                                         return AlertDialog(
//                                           title: const Text(
//                                             'Are You sure?',
//                                             style: TextStyle(
//                                                 fontSize: 22,
//                                                 fontWeight: FontWeight.bold),
//                                           ),
//                                           content: Text(
//                                             'Dear ${nameController.text}, \nYou will pay Rs ${widget.cost} to get ${widget.category} for ${widget.days} day/s.',
//                                             style: const TextStyle(
//                                               fontSize: 18,
//                                             ),
//                                           ),
//                                           actions: [
//                                             TextButton(
//                                               style: ButtonStyle(
//                                                 foregroundColor:
//                                                     MaterialStateProperty.all<
//                                                         Color>(Colors.blue),
//                                               ),
//                                               onPressed: () {
//                                                 showDialog(
//                                                     context: this.context,
//                                                     builder:
//                                                         (BuildContext context) {
//                                                       return AlertDialog(
//                                                         title: const Text(
//                                                             'Well done!!',
//                                                             style: TextStyle(
//                                                                 fontSize: 22,
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .bold)),
//                                                         actions: [
//                                                           TextButton(
//                                                             style: ButtonStyle(
//                                                               foregroundColor:
//                                                                   MaterialStateProperty.all<
//                                                                           Color>(
//                                                                       Colors
//                                                                           .blue),
//                                                             ),
//                                                             onPressed: () {
//                                                               Navigator.push(
//                                                                   context,
//                                                                   MaterialPageRoute(
//                                                                       builder:
//                                                                           (context) =>
//                                                                               WelcomePage()));
//                                                             },
//                                                             child: const Text(
//                                                                 'Rent more'),
//                                                           ),
//                                                           TextButton(
//                                                             style: ButtonStyle(
//                                                               foregroundColor:
//                                                                   MaterialStateProperty.all<
//                                                                           Color>(
//                                                                       Colors
//                                                                           .blue),
//                                                             ),
//                                                             onPressed: () {
//                                                               exit(0);
//                                                             },
//                                                             child: const Text(
//                                                                 'EXIT'),
//                                                           )
//                                                         ],
//                                                       );
//                                                     });
//                                               },
//                                               child: const Text('OK'),
//                                             ),
//                                             TextButton(
//                                               style: ButtonStyle(
//                                                 foregroundColor:
//                                                     MaterialStateProperty.all<
//                                                         Color>(Colors.blue),
//                                               ),
//                                               onPressed: () {
//                                                 Navigator.push(
//                                                     context,
//                                                     MaterialPageRoute(
//                                                         builder: (context) =>
//                                                             WelcomePage()));
//                                               },
//                                               child: const Text('Cancel'),
//                                             )
//                                           ],
//                                         );
//                                       });
//                                 }
//                               });
//                             },
//                             icon: const Icon(Icons.arrow_forward)),
//                         GestureDetector(
//                           onTap: () {
//                             // Navigator.push(
//                             //   this.context,
//                             //   MaterialPageRoute(
//                             //       builder: (context) =>
//                             //           RegisterView()));
//                           },
//                           child: Text('Create New Account',
//                               style: TextStyle(
//                                 fontSize: 18.0,
//                                 color: Colors.red,
//                                 fontWeight: FontWeight.bold,
//                                 decoration: TextDecoration.underline,
//                                 decorationColor: Colors.black,
//                                 decorationStyle: TextDecorationStyle.solid,
//                                 letterSpacing: -1.0,
//                                 wordSpacing: 5.0,
//                               )),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Positioned(
//             bottom: 0,
//             left: 0,
//             right: 0,
//             child: CategoryBottomBar(),
//           )
//         ]),
//       ),
//     );
//   }
// }
