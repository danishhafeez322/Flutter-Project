import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:kartal/kartal.dart';
import 'package:mad_project/main.dart';
import 'package:mad_project/pages/upload.dart';
import 'package:mad_project/screens/ChatRoom.dart';
import 'package:mad_project/widgets/AppBar.dart';
import 'package:mad_project/widgets/DividerPlus.dart';

import '../core/constant/app_color.dart';
import '../core/constant/app_text.dart';
import '../product/widget/custom_elevated_button.dart';
import '../widgets/DetailsCarousal.dart';
import '../widgets/SearchDetail.dart';
import 'WelcomePage.dart';
import 'categorybottombar.dart';
import 'login_view.dart';

// ignore: must_be_immutable
class DetailsPage extends StatefulWidget {
  var myItem_id;
  var myItem;
  // int days = 1;
  // int cost = 0;
  bool isVisible = false;

  // SubCategory? subCategory;
  final controllerStartDate1 = TextEditingController();
  final controllerEndDate1 = TextEditingController();
  final OfferPriceController = TextEditingController();
  final OfferGauranteecontroller = TextEditingController();

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
  Map<String, dynamic>? CurrentUserMap;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> createOffer(var st_date, var end_date, var itemUser, var price,
      var gaurantee_price) async {
    print("running");
    print("================================" + st_date);

    try {
      await FirebaseFirestore.instance
          .collection('/users')
          .doc(_auth.currentUser!.uid)
          // .where("email", isEqualTo: "danish.bcss19@iba-suk.edu.pk")
          .get()
          .then((value) {
        setState(() {
          CurrentUserMap = value.data();
        });
      });

      if(st_date.toString() != "" && end_date.toString() != "" && price.toString() != "" && gaurantee_price.toString() != "")
      { 
        await FirebaseFirestore.instance
          .collection('order')
          .doc(itemUser)
          .collection('offer')
          .doc()
          .set({
            'startDate': st_date.toString(),
            'endDate': end_date.toString(),
            'itemId': widget.myItem!.id,
            'itemTitle': widget.myItem!.title,
            'itemImage': widget.myItem!.images,
            'senderId': FirebaseAuth.instance.currentUser!.uid,
            'price': price,
            'gaurantee_price': gaurantee_price,
          });

          Fluttertoast.showToast(
            msg: "Offer Send Successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      }
      else{
        Fluttertoast.showToast(
          msg: "Please Fill All Fields",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: "" + e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  Future<void> myItems() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();

    await FirebaseFirestore.instance
        .collection('/users')
        .doc(_auth.currentUser!.uid)
        .get()
        .then((value) {
      setState(() {
        CurrentUserMap = value.data();
      });
    });

    final docUser = await FirebaseFirestore.instance
        .collection('/Items')
        .doc(widget.myItem_id);

    final doc = await docUser.get();

    if (doc.exists) {
      widget.myItem = MyItem.fromMap(doc.data() as Map<String, dynamic>);
    } else {
      print("myitem not found");
    }
    await FirebaseFirestore.instance
        .collection('/users')
        .doc(widget.myItem!.user_id)
        .get()
        .then((value) {
      setState(() {
        UserMap = value.data();
      });
    });

    // setState(() {});
  }

  String chatRoomId(String user1, String user2) {
    if (user1.toLowerCase().codeUnits[0] > user2.toLowerCase().codeUnits[0]) {
      return "$user1$user2";
    } else {
      return "$user2$user1";
    }
  }

  @override
  void initState() {
    myItems();
    super.initState();

    // createOffer();
  }

  Widget build(BuildContext context) {
    myItems();
    return Scaffold(
        appBar: MainAppBar(),
        // bottomNavigationBar: CategoryBottomBar(),
        body: (widget.myItem != null)
            ? (Stack(children: [
                  SingleChildScrollView(
                    child: Container(
                      // height: 00,
                      child: 
                      Column(children: [
                        Stack(
                          children: [
                            Container(
                              height: 180,
                              child: 
                              DetailsCarousal(
                                  images: widget.myItem!.images),
                            ),
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
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18)),
                                  TextSpan(
                                    text: widget.myItem!.title,
                                  )
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
                                ),
                                 Container(
                                  color: Colors.white10,
                                  padding: EdgeInsets.all(20),
                                  width: double.infinity,
                                  child: Text("From : " + widget.myItem!.city),
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
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                    text: 'Rs ' +
                                        widget.myItem!.price.toString() +
                                        '/day',
                                  )
                                ]),
                              ),
                              Text.rich(
                                TextSpan(children: [
                                  TextSpan(
                                      text: 'Guaranteed Price: ',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                    text: 'Rs ' +
                                        widget.myItem!.guarantee_price
                                            .toString(),
                                  )
                                ]),
                              ),
                            ],
                          ),
                        ),
                        dividerPlus(),
                        Padding(
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
                                          .controllerStartDate1, //editing controller of this TextField
                                      decoration: const InputDecoration(
                                          fillColor: Colors.green,
                                          icon: Icon(Icons
                                              .calendar_today), //icon of text field
                                          hintText: "Start Date"),
                                      readOnly: true,
                                      onTap: () async {
                                        //when click we have to show the datepicker
                                        DateTime? pickedDate =
                                            await showDatePicker(
                                                context: context,
                                                initialDate: DateTime
                                                    .now(), //get today's date
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
                                          DateTime? pickedDate =
                                              await showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime
                                                      .now(), //get today's date
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
                            Container(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        // Navigator.pop(context);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                StreamBuilder<User?>(
                                                    stream: FirebaseAuth
                                                        .instance
                                                        .authStateChanges(),
                                                    builder:
                                                        (context, snapshot) {
                                                      if (snapshot.hasData) {
                                                        return WelcomePage();
                                                      }
                                                      return LoginView();
                                                    }),
                                          ),
                                        );
                                      },
                                      child: CustomElevatedButton(
                                        onPressed: () {
                                          if (_auth.currentUser!.uid ==
                                              widget.myItem!.user_id) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                    'You cannot rent yours item'),
                                              ),
                                            );
                                          } else {
                                            createOffer(
                                                widget
                                                    .controllerStartDate1.text,
                                                widget.controllerEndDate1.text,
                                                widget.myItem.user_id,
                                                widget.myItem!.price,
                                                widget.myItem!.guarantee_price);
                                          }
                                        },
                                        child: Text(
                                          AppText.rentit.toUpperCase(),
                                          style: const TextStyle(
                                              color: Colors.white),
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
                                        if (_auth.currentUser!.uid ==
                                            widget.myItem!.user_id) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                  'You cannot chat with yourself'),
                                            ),
                                          );
                                        } else {
                                          String roomId = chatRoomId(
                                              CurrentUserMap!['uname'],
                                              UserMap!['uname']);
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ChatRoom(
                                                        chatRoomId: roomId,
                                                        userMap: UserMap!,
                                                        user2: widget
                                                            .myItem!.user_id,
                                                      )));
                                        }
                                        ;
                                      },
                                      child: CustomElevatedButton(
                                        child: Text(
                                          AppText.ChatNow.toUpperCase(),
                                          style: const TextStyle(
                                              color: Colors.white),
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
                          child: ExpansionTile(
                            title: Text(
                              "CREATE YOUR OFFER",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 3, 64, 5)),
                            ), //header title
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 15, left: 20, right: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 150,
                                      height: 40,
                                      child: TextField(
                                        controller: widget.OfferPriceController,
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
                                        controller:
                                            widget.OfferGauranteecontroller,
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
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 15, right: 15, top: 10, bottom: 5),
                                child: Container(
                                  height: 35,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                              DateTime? pickedDate =
                                                  await showDatePicker(
                                                      context: context,
                                                      initialDate: DateTime
                                                          .now(), //get today's date
                                                      firstDate: DateTime
                                                          .now(), //DateTime.now() - not to allow to choose before today.
                                                      lastDate: DateTime(2101));
                                              if (pickedDate != null) {
                                                String formattedDate = DateFormat(
                                                        'dd-MM-yyyy')
                                                    .format(
                                                        pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed

                                                setState(() {
                                                  widget.controllerStartDate2
                                                          .text =
                                                      formattedDate; //set foratted date to TextField value.
                                                });
                                                // print(controllerStartDate.text);
                                              } else {
                                                print("Date is not selected");
                                              }
                                            }),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
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
                                                DateTime? pickedDate =
                                                    await showDatePicker(
                                                        context: context,
                                                        initialDate: DateTime
                                                            .now(), //get today's date
                                                        firstDate: DateTime
                                                            .now(), //DateTime.now() - not to allow to choose before today.
                                                        lastDate:
                                                            DateTime(2101));
                                                if (pickedDate != null) {
                                                  String formattedDate =
                                                      DateFormat('dd-MM-yyyy')
                                                          .format(pickedDate);

                                                  setState(() {
                                                    widget.controllerEndDate2
                                                            .text =
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
                              Padding(
                                padding: EdgeInsets.only(top: 10, bottom: 5),
                                child: Column(children: [
                                  CustomElevatedButton(
                                    onPressed: () {
                                      createOffer(
                                          widget.controllerStartDate2.text,
                                          widget.controllerEndDate2.text,
                                          widget.myItem.user_id,
                                          widget.OfferPriceController.text,
                                          widget.OfferGauranteecontroller.text);
                                    },
                                    child: Text(
                                      "Send Offer".toUpperCase(),
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  // ),
                                ]),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 2.0, left: 10, bottom: 10),
                              child: Text(
                                "Recommended Items:",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87),
                              ),
                            ),
                          ],
                        ),
                        StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection("Items")
                              .snapshots(),
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.hasError) {
                              return Text("something is wrong");
                            }

                            return Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, bottom: 20, right: 5, left: 5),
                              child: Container(
                                // height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Expanded(
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: snapshot.data!.docs.length,
                                    itemBuilder: (_, index) {
                                      var data = snapshot.data!.docs[index]
                                          .data() as Map<String, dynamic>;

                                      if (data["title"].toLowerCase().toString().contains(
                                              widget.myItem!.title
                                                  .toLowerCase()) ||
                                          widget.myItem!.title
                                              .toLowerCase()
                                              .contains(data["title"]
                                                  .toLowerCase()
                                                  .toString()) ||
                                          data["description"]
                                              .toString()
                                              .contains(widget.myItem!.title
                                                  .toLowerCase())) {
                                        if (!data["id"]
                                            .contains(widget.myItem_id)) {
                                          return SearchDetails(item: data);
                                        }
                                        // return SearchDetails(item: data);
                                      }
                                      return Container();
                                    },
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ]),
                    ),
                  ),
                ]
                )
                )
            : Container());
  }
}
