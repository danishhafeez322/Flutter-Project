import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../../ChatRoom.dart';

class ChatCard extends StatefulWidget {
  final Map<String, dynamic> item;

  const ChatCard({
    super.key,
    required this.item,
  });

  @override
  State<ChatCard> createState() => _ChatCardState();
}

class _ChatCardState extends State<ChatCard> {
  Map<String, dynamic>? UserMap;

  Map<String, dynamic>? currentUserMap;

  Future<void> user2() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();

    await FirebaseFirestore.instance
        .collection('/users')
        .doc(widget.item['user2'])
        .get()
        .then((value) {
      setState(() {
        UserMap = value.data();
      });
      print(UserMap);
    });

    await FirebaseFirestore.instance
        .collection('/users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      setState(() {
        currentUserMap = value.data();
      });
      print(currentUserMap);
    });

    setState(() {});
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
    user2();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: Colors.black45)),
          // borderRadius: BorderRadius.circular(20),
        ),
        //width: 160,
        height: 75.0,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () async {
              String roomId =
                  chatRoomId(currentUserMap!['uname'], UserMap!['uname']);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ChatRoom(
                            chatRoomId: roomId,
                            userMap: UserMap!,
                          )));
            },
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(0.1),
                    child: Container(
                      margin: EdgeInsets.all(6.0),
                      // width: 58.0,
                      // height: 58.0,
                      child:
                          Icon(Icons.person, size: 40.0, color: Colors.black45),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 10.0, left: 5),
                              child: Text(
                                UserMap!['uname'],
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.only(left: 5),
                            //   child: Text(
                            //     'user2',
                            //     overflow: TextOverflow.ellipsis,
                            //     style: TextStyle(
                            //       color: Colors.black.withOpacity(0.6),
                            //       fontWeight: FontWeight.normal,
                            //       fontSize: 12.0,
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
