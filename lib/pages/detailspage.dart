import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kartal/kartal.dart';
import 'package:mad_project/models/subcategory.dart';
import 'package:mad_project/pages/upload.dart';
import 'package:mad_project/screens/ChatRoom.dart';
import 'package:mad_project/widgets/AppBar.dart';
import 'package:mad_project/widgets/DividerPlus.dart';

import '../core/constant/app_color.dart';
import '../core/constant/app_text.dart';
import '../product/widget/custom_elevated_button.dart';
import '../widgets/DetailsCarousal.dart';
import 'Registorpage.dart';
import 'categorybottombar.dart';
import 'login_view.dart';
import 'upload.dart';

// ignore: must_be_immutable
class DetailsPage extends StatefulWidget {
  var myItem_id;
  var myItem;
  int days = 1;
  double cost = 0.0;
  bool isVisible = false;
  // SubCategory? subCategory;
  final controllerStartDate1 = TextEditingController();
  final controllerEndDate1 = TextEditingController();

  final controllerStartDate2 = TextEditingController();
  final controllerEndDate2 = TextEditingController();
  DetailsPage({
    Key? key,
    this.myItem_id,
    // this.subCategory,
  }) : super(key: key);
  @override
  DetailsPageState createState() => DetailsPageState();
}

class DetailsPageState extends State<DetailsPage> {
  Map<String, dynamic>? UserMap;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    createOffer();
    myItems();
    setState(() {
      
    });
  }

  Future<void> createOffer() async {
    print("running");
    await FirebaseFirestore.instance
        .collection('/users')
        .where("email", isEqualTo: "danish.bcss19@iba-suk.edu.pk")
        .get()
        .then((value) {
      setState(() {
        UserMap = value.docs[0].data();
      });
      print(UserMap);
    });
    await FirebaseFirestore.instance
        .collection('order')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({});
    await FirebaseFirestore.instance
        .collection('order')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('offer')
        .doc()
        .set({
      'startData': DateTime.now(),
      'endData': DateTime.now(),
      'item': widget.myItem,
      'senderName': FirebaseAuth.instance.currentUser!.uid,
    });
  }
  
    Future<void> myItems() async{  
      
      final docUser = await FirebaseFirestore.instance.collection('/Items').doc(widget.myItem_id);
      final doc = await docUser.get();
      if(doc.exists)
      {        
        widget.myItem = MyItem.fromMap(doc.data() as Map<String, dynamic>);
      }
      setState(() {
        
      });
    }

  String chatRoomId(String user1, String user2) {
    if (user1[0].toLowerCase().codeUnits[0] >
        user2.toLowerCase().codeUnits[0]) {
      return "$user1$user2";
    } else {
      return "$user2$user1";
    }
  }
//   _launchWhatsapp() async {
//     if (currentUser.contact_no == '' || currentUser.contact_no.length < 11 ) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text("User has not provided contact number"),
//         ),
//       );
//       return;
//     }
//     else if( currentUser.contact_no[0] == '0' && currentUser.contact_no[1] == '3' &&currentUser.contact_no.length == 11)
//     {
//       currentUser.contact_no = currentUser.contact_no.substring(1);
//           var whatsapp = "+92${currentUser.contact_no}";
//         var whatsappAndroid =Uri.parse("whatsapp://send?phone=$whatsapp&text=hello");
//         if (await canLaunchUrl(whatsappAndroid)) {
//             await launchUrl(whatsappAndroid);
//         } else {
//             ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//               content: Text("WhatsApp is not installed on the device"),
//             ),
//           );
//         }
//     }
// }
  Widget build(BuildContext context) {
    myItems();
    return Scaffold(
      appBar: MainAppBar(),
      bottomNavigationBar: CategoryBottomBar(),
      body: (widget.myItem != null)? (Container(
        alignment: Alignment.center,
        child: Stack(children: [
          SingleChildScrollView(
            child: Container(
              height: 900,
              child: Column(children: [
                Stack(
                  children: [
                    // Container(
                    //   height: 200,
                    //   child: DetailsCarousal(images: images),
                    // ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 5, right: 20, left: 20, bottom: 5),
                  child: Row(
                    children: [
                      Text.rich(
                        TextSpan(children: [
                          TextSpan(
                              text: 'Title: ',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                          // TextSpan(
                          //   text: widget.myItem!.title,
                          // )
                        ]),
                      ),
                    ],
                  ),
                ),
                dividerPlus(),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 0, right: 20, left: 20, bottom: 5),
                  child: Column(children: [
                    ExpansionTile(
                      title: Text(
                        "Description",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ), //header title
                      children: [
                        Container(
                          color: Colors.white10,
                          padding: EdgeInsets.all(20),
                          width: double.infinity,
                          child: Text(widget.myItem!.description),
                        )
                      ],
                    ),
                  ]),
                ),
                dividerPlus(),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 5, right: 20, left: 20, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(children: [
                          TextSpan(
                              text: 'Price: ',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(
                            text: 'Rs ' +
                                // widget.myItem!.price.toString() +
                                '/day',
                          )
                        ]),
                      ),
                      Text.rich(
                        TextSpan(children: [
                          TextSpan(
                              text: 'Guaranteed Price: ',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(
                            text: 'Rs ',
                            // widget.myItem!.guarantee_price.toString(),
                          )
                        ]),
                      ),
                    ],
                  ),
                ),
                dividerPlus(),
                Padding(
                  padding:
                      EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 5),
                  child: Container(
                    height: 35,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 160,
                          child: TextField(
                              controller: widget
                                  .controllerStartDate1, //editing controller of this TextField
                              decoration: const InputDecoration(
                                  fillColor: Colors.green,
                                  icon: Icon(Icons
                                      .calendar_today), //icon of text field
                                  hintText: "Start Date"),
                              readOnly: true,
                              onTap: () async {
                                //when click we have to show the datepicker
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate:
                                        DateTime.now(), //get today's date
                                    firstDate: DateTime
                                        .now(), //DateTime.now() - not to allow to choose before today.
                                    lastDate: DateTime(2101));
                                if (pickedDate != null) {
                                  String formattedDate =
                                      DateFormat('dd-MM-yyyy').format(
                                          pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed

                                  setState(() {
                                    widget.controllerStartDate1.text =
                                        formattedDate; //set foratted date to TextField value.
                                  });
                                  // print(controllerStartDate.text);
                                } else {
                                  print("Date is not selected");
                                }
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Container(
                            width: 150,
                            child: TextField(
                                controller: widget
                                    .controllerEndDate1, //editing controller of this TextField
                                decoration: const InputDecoration(
                                  fillColor: Colors.green,
                                  icon: Icon(Icons
                                      .calendar_today), //icon of text field
                                  hintText: "End Date",
                                ),
                                readOnly:
                                    true, // when true user cannot edit text
                                onTap: () async {
                                  //when click we have to show the datepicker
                                  DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate:
                                          DateTime.now(), //get today's date
                                      firstDate: DateTime
                                          .now(), //DateTime.now() - not to allow to choose before today.
                                      lastDate: DateTime(2101));
                                  if (pickedDate != null) {
                                    String formattedDate =
                                        DateFormat('dd-MM-yyyy')
                                            .format(pickedDate);

                                    setState(() {
                                      widget.controllerEndDate1.text =
                                          formattedDate; //set foratted date to TextField value.
                                    });
                                  } else {
                                    print("Date is not selected");
                                  }
                                }),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10, right: 25, left: 25, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text.rich(
                            TextSpan(children: [
                              TextSpan(text: 'Total rent price: '),
                            ]),
                          ),
                          Text(
                            widget.cost > 0
                                ? '${widget.cost}'
                                : '${widget.cost = 0.0}',
                            // : '${widget.cost = (widget.myItem!.price + widget.myItem!.guarantee_price) as double}',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                // Navigator.pop(context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => StreamBuilder<User?>(
                                        stream: FirebaseAuth.instance
                                            .authStateChanges(),
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData) {
                                            return RegisterView(
                                                // category: widget.subCategory.name,
                                                // days: widget.days,
                                                // cost: widget.cost,
                                                );
                                          }
                                          return LoginView(
                                              // category: widget.subCategory.name,
                                              // days: widget.days,
                                              // cost: widget.cost,
                                              );
                                        }),
                                  ),
                                );
                              },
                              child: CustomElevatedButton(
                                child: Text(
                                  AppText.rentit.toUpperCase(),
                                  style: const TextStyle(color: Colors.white),
                                ),
                                borderRadius: 20,
                                color: AppColors.uploadColor,
                                height: context.height * 0.07,
                                width: context.width * 0.4,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                String roomId =
                                    chatRoomId("shery", UserMap!['uname']);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ChatRoom(
                                            chatRoomId: roomId,
                                            userMap: UserMap!)));
                              },
                              child: CustomElevatedButton(
                                child: Text(
                                  AppText.ChatNow.toUpperCase(),
                                  style: const TextStyle(color: Colors.white),
                                ),
                                borderRadius: 20,
                                color: AppColors.chatColor,
                                height: context.height * 0.07,
                                width: context.width * 0.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                dividerPlus(),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: GestureDetector(
                    onTap: () {},
                    child: CustomElevatedButton(
                      child: Text(
                        "Create Your Offer".toUpperCase(),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      borderRadius: 20,
                      color: Color.fromARGB(255, 7, 67, 71),
                      height: context.height * 0.07,
                      width: context.width * 0.7,
                      onPressed: () {
                        setState(() {
                          widget.isVisible = true;
                        });
                      },
                    ),
                  ),
                ),
                Visibility(
                  visible: widget.isVisible,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 15, left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 150,
                          height: 40,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Your Price",
                            ),
                            maxLines: 1,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          width: 150,
                          height: 40,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Gauarnteed Price",
                            ),
                            maxLines: 1,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: widget.isVisible,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 15, right: 15, top: 10, bottom: 5),
                    child: Container(
                      height: 35,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 160,
                            child: TextField(
                                controller: widget
                                    .controllerStartDate2, //editing controller of this TextField
                                decoration: const InputDecoration(
                                    fillColor: Colors.green,
                                    icon: Icon(Icons
                                        .calendar_today), //icon of text field
                                    hintText: "Start Date"),
                                readOnly: true,
                                onTap: () async {
                                  //when click we have to show the datepicker
                                  DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate:
                                          DateTime.now(), //get today's date
                                      firstDate: DateTime
                                          .now(), //DateTime.now() - not to allow to choose before today.
                                      lastDate: DateTime(2101));
                                  if (pickedDate != null) {
                                    String formattedDate =
                                        DateFormat('dd-MM-yyyy').format(
                                            pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed

                                    setState(() {
                                      widget.controllerStartDate2.text =
                                          formattedDate; //set foratted date to TextField value.
                                    });
                                    // print(controllerStartDate.text);
                                  } else {
                                    print("Date is not selected");
                                  }
                                }),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Container(
                              width: 150,
                              child: TextField(
                                  controller: widget
                                      .controllerEndDate2, //editing controller of this TextField
                                  decoration: const InputDecoration(
                                    fillColor: Colors.green,
                                    icon: Icon(Icons
                                        .calendar_today), //icon of text field
                                    hintText: "End Date",
                                  ),
                                  readOnly:
                                      true, // when true user cannot edit text
                                  onTap: () async {
                                    //when click we have to show the datepicker
                                    DateTime? pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate:
                                            DateTime.now(), //get today's date
                                        firstDate: DateTime
                                            .now(), //DateTime.now() - not to allow to choose before today.
                                        lastDate: DateTime(2101));
                                    if (pickedDate != null) {
                                      String formattedDate =
                                          DateFormat('dd-MM-yyyy')
                                              .format(pickedDate);

                                      setState(() {
                                        widget.controllerEndDate2.text =
                                            formattedDate; //set foratted date to TextField value.
                                      });
                                    } else {
                                      print("Date is not selected");
                                    }
                                  }),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: widget.isVisible,
                  child: Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Column(children: [
                      GestureDetector(
                        onTap: () {},
                        child: CustomElevatedButton(
                          child: Text(
                            "Send Offer".toUpperCase(),
                            style: const TextStyle(color: Colors.white),
                          ),
                          borderRadius: 20,
                          color: Color.fromARGB(255, 2, 65, 15),
                          height: context.height * 0.07,
                          width: context.width * 0.4,
                        ),
                      ),
                    ]),
                  ),
                ),
              ]),
            ),
          ),
        ]),
      )): Container()
    );
  }
}
