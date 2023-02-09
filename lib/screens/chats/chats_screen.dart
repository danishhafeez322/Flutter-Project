import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mad_project/pages/categorybottombar.dart';
import 'package:mad_project/widgets/AppBar.dart';
import '../chats/components/body.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  late StreamSubscription subscription;
  var isDeviceConnected = false;
  bool isAlertSet = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Map<String, dynamic>? allDocMap;
  @override
  void initState() {
    getConnectivity();
    getAllDoc();
    super.initState();
  }

  Future<void> getAllDoc() async {
    WidgetsFlutterBinding.ensureInitialized();
    // await Firebase.initializeApp();
    await FirebaseFirestore.instance
        .collection('chatroom')
        .where(FieldPath.documentId, arrayContains: "dani")
        .get()
        .then((event) {
      if (event.docs.isNotEmpty) {
        Map<String, dynamic> documentData =
            event.docs.single.data as Map<String, dynamic>;
        print(documentData);
      }
    }).catchError((e) => print("error fetching data: $e"));

    // var alldocs =
    //     await FirebaseFirestore.instance.collection('/chatroom').snapshots();

    // print(alldocs.toString().length);

    //   .then((value) {
    // setState(() {
    //   allDocMap = value.data();
    //   print(allDocMap);
    //   // CurrentUserMap = value.data();
    // });

    // await FirebaseFirestore.instance
    //     .collection('/chatRoom')
    //     .doc(_auth.currentUser!.uid)
    //     .get()
    //     .then((value) {
    //   setState(() {
    //     CurrentUserMap = value.data();
    //   });
    // });

    // final docUser = await FirebaseFirestore.instance
    //     .collection('/Items')
    //     .doc(widget.myItem_id);

    // final doc = await docUser.get();
    // doc1 = doc.data() as Map<String, dynamic>;

    // if (doc.exists) {
    //   widget.myItem = MyItem.fromMap(doc.data() as Map<String, dynamic>);
    // }
    // await FirebaseFirestore.instance
    //     .collection('/users')
    //     .doc(widget.myItem!.user_id)
    //     .get()
    //     .then((value) {
    //   setState(() {
    //     UserMap = value.data();
    //   });
    // });

    // setState(() {});
  }

  getConnectivity() =>
      subscription = Connectivity().onConnectivityChanged.listen(
        (ConnectivityResult result) async {
          isDeviceConnected = await InternetConnectionChecker().hasConnection;
          if (!isDeviceConnected && isAlertSet == false) {
            showDialogBox();
            setState(() {
              isAlertSet = true;
            });
          }
        },
      );

  showDialogBox() => showCupertinoDialog<String>(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: const Text('No Connection'),
          content: const Text('Please check your internet connectivity'),
          actions: <Widget>[
            TextButton(
                onPressed: () async {
                  Navigator.pop(context, 'cancel');
                  setState(() {
                    isAlertSet = false;
                  });
                  isDeviceConnected =
                      await InternetConnectionChecker().hasConnection;
                  if (!isDeviceConnected) {
                    showDialogBox();
                    setState(() {
                      isAlertSet = true;
                    });
                  }
                },
                child: const Text('OK'))
          ],
        ),
      );

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pushNamed(context, "/welcome");
        return Future.value(false);
      },
      child: Scaffold(
        appBar: MainAppBar(),
        body: Container(),
        // body: Body(),
        // body:
        //                 StreamBuilder(
        //                   stream: FirebaseFirestore.instance
        //                       .collection("Items")
        //                       .snapshots(),
        //                   builder: (BuildContext context,
        //                       AsyncSnapshot<QuerySnapshot> snapshot) {
        //                     if (snapshot.hasError) {
        //                       return Text("something is wrong");
        //                     }

        //                     return Padding(
        //                       padding: const EdgeInsets.only(
        //                           top: 10, bottom: 20, right: 5, left: 5),
        //                       child: Container(
        //                         // height: 200,
        //                         decoration: BoxDecoration(
        //                           borderRadius: BorderRadius.circular(12),
        //                         ),
        //                         child: Expanded(
        //                           child: ListView.builder(
        //                             shrinkWrap: true,
        //                             itemCount: snapshot.data!.docs.length,
        //                             itemBuilder: (_, index) {
        //                               var data = snapshot.data!.docs[index]
        //                                   .data() as Map<String, dynamic>;

        //                               if (data["title"].toLowerCase().toString().contains(
        //                                       widget.myItem!.title
        //                                           .toLowerCase()) ||
        //                                   widget.myItem!.title
        //                                       .toLowerCase()
        //                                       .contains(data["title"]
        //                                           .toLowerCase()
        //                                           .toString()) ||
        //                                   data["description"]
        //                                       .toString()
        //                                       .contains(widget.myItem!.title
        //                                           .toLowerCase())) {
        //                                 if (!data["id"]
        //                                     .contains(widget.myItem_id)) {
        //                                   return SearchDetails(item: data);
        //                                 }
        //                                 // return SearchDetails(item: data);
        //                               }
        //                               return Container();
        //                             },
        //                           ),
        //                         ),
        //                       ),
        //                     );
        //                   },
        //                 ),
        bottomNavigationBar: CategoryBottomBar(),
      ),
    );
  }
}
