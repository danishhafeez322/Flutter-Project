import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mad_project/pages/categorybottombar.dart';
import 'package:mad_project/widgets/AppBar.dart';
// import '../chats/components/body.dart';
import '../../pages/login_view.dart';
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

  @override
  void initState() {
    getConnectivity();
    super.initState();
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
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          User? user = snapshot.data;
          if (user == null) {
            return LoginView();
          }
          return MyChat();
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}

class MyChat extends StatefulWidget {
  const MyChat({super.key});

  @override
  State<MyChat> createState() => _MyChatState();
}

class _MyChatState extends State<MyChat> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    DateTime timeBackPressed = DateTime.now();

    return WillPopScope(
        onWillPop: () async {
          DateTime now = DateTime.now();
          if (now.difference(timeBackPressed) > Duration(seconds: 2)) {
            timeBackPressed = now;
            Fluttertoast.showToast(
                msg: "Press back again to exit", fontSize: 16);
            return false;
          }
          exit(0);
        },
        child: Scaffold(
          appBar: MainAppBar(),
          body: Container(
            height: size.height / 1.25,
            width: size.width,
            child: StreamBuilder<QuerySnapshot>(
                stream: _firestore.collection('chatroom').snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.data != null) {
                    return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: ((context, index) {
                          // var data = snapshot.data!.docs[index].data()
                          //     as Map<String, dynamic>;
                          QueryDocumentSnapshot<Object?> map =
                              snapshot.data!.docs[index];
                          Map<String, dynamic> map1 =
                              map.data() as Map<String, dynamic>;

                          if (map1['user1'].contains(_auth.currentUser!.uid) ||
                              map1['user2'].contains(_auth.currentUser!.uid)) {
                            return ChatCard(
                                item: map.data() as Map<String, dynamic>);
                          } else {
                            return Container();
                          }
                        }));
                  } else {
                    return Container();
                  }
                }),
          ),
        ));
  }
}
