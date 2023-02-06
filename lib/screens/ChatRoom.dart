import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatRoom extends StatelessWidget {
  final TextEditingController _message = TextEditingController();
  final Map<String, dynamic>? userMap;
  final String chatRoomId;

  ChatRoom({required this.chatRoomId, required this.userMap});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(userMap!['uname']),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size.height / 1.25,
              width: size.width,
              child: StreamBuilder<QuerySnapshot>(builder:
                  (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.data != null) {
                  return ListView.builder(
                      itemCount: snapshot.data?.docs.length,
                      itemBuilder: ((context, index) {
                        return Text(snapshot.data?.docs[index]['message']);
                      }));
                } else {
                  return Container();
                }
              }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
          height: size.height / 10,
          width: size.width,
          child: Container(
            height: size.height / 12,
            width: size.width / 1.1,
            child: Row(children: [
              Container(
                height: size.height / 12,
                width: size.width / 1.5,
                child: TextField(
                  controller: _message,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                ),
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.send))
            ]),
          )),
    );
  }
}
