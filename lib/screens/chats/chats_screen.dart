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
import 'components/chat_card.dart';

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

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Map<String, dynamic>? allDocMap;

  Map<String, dynamic>? CurrentUserMap;

  int count = 1;
  @override
  void initState() {
    getConnectivity();
    getAllDoc();
    super.initState();
  }

  Future<void> getAllDoc() async {
    WidgetsFlutterBinding.ensureInitialized();
    count = await FirebaseFirestore.instance
        .collection('chatroom')
        .get()
        .then((value) => value.size);
    // await Firebase.initializeApp();
    // await FirebaseFirestore.instance
    //     .collection('chatroom')
    //     .where(document.toString().contains(CurrentUserMap!['uname']))
    //     .get()
    //     .then((value) {
    //   setState(() {
    //     CurrentUserMap = value.docs.data();
    //   });
    // });
    // .doc()
    // .id
    // .toString()
    // .contains(CurrentUserMap!['uname']);

    //     .get()
    //     .then((event) {
    //   if (event.docs.isNotEmpty) {
    //     Map<String, dynamic> documentData =
    //         event.docs.single.data as Map<String, dynamic>;
    //     print(documentData);
    //   }
    // }).catchError((e) => print("error fetching data: $e"));

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
    //     .collection('chatRoom')
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
    final size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () {
        Navigator.pushNamed(context, "/welcome");
        return Future.value(false);
      },
      child: Scaffold(
        appBar: MainAppBar(),
        body: Container(
          height: size.height / 1.25,
          width: size.width,
          child: StreamBuilder<QuerySnapshot>(
              stream: _firestore
                  .collection('chatroom')
                  // .doc('kamrandani')
                  // .collection('chats')
                  // .orderBy("time", descending: false)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.data != null) {
                  return ListView.builder(
                      itemCount: count,
                      itemBuilder: ((context, index) {
                        // var data = snapshot.data!.docs[index].data()
                        //     as Map<String, dynamic>;
                        QueryDocumentSnapshot<Object?> map =
                            snapshot.data!.docs[index];
                        print(map.data());
                        Map<String, dynamic> map1 =
                            map.data() as Map<String, dynamic>;

                        // return ChatCard(
                        //     item: map.data() as Map<String, dynamic>);
                        if (map1['user1'].contains(_auth.currentUser!.uid) ||
                            map1['user2'].contains(_auth.currentUser!.uid)) {
                          return ChatCard(
                              item: map.data() as Map<String, dynamic>);
                        } else {
                          return Container();
                        }
                      }));
                } else {
                  return Container(child: Text("Nothing found"));
                }
              }),
        ),
        // body: Container(),
        // body: Body(),
        // body: StreamBuilder(
        //   stream: _firestore
        //       .collection('chatroom')
        //       .doc()
        //       .collection('chats')
        //       .orderBy("time", descending: false)
        //       .snapshots(),
        //   builder:
        //       (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        //     if (snapshot.hasError) {
        //       return Text("something is wrong");
        //     }

        //     return Padding(
        //       padding:
        //           const EdgeInsets.only(top: 10, bottom: 20, right: 5, left: 5),
        //       child: Container(
        //         // height: 200,
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(12),
        //         ),
        //         child: Expanded(
        //           child: ListView.builder(
        //             shrinkWrap: true,
        //             itemCount: snapshot.data!.docs.length,
        //             itemBuilder: (_, index) {
        //               var data = snapshot.data!.docs[index].data()
        //                   as Map<String, dynamic>;
        //               if (_auth.currentUser != null) {
        //                 return Row(
        //                   children: [
        //                     Text(data['sendby']),
        //                   ],
        //                 );
        //               }

        //               return Container();
        //             },
        //           ),
        //         ),
        //       ),
        //     );
        //   },
        // ),
        bottomNavigationBar: CategoryBottomBar(),
      ),
    );
  }
}
