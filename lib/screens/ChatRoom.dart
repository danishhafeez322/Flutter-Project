import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import '../core/constant/app_color.dart';

class ChatRoom extends StatefulWidget {
  final Map<String, dynamic>? userMap;
  final String chatRoomId;
  ChatRoom({required this.chatRoomId, required this.userMap});

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  final TextEditingController _message = TextEditingController();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  File? imageFile;

  Map<String, dynamic>? CurrentUserMap;

  Future getUser() async {
    await _firestore
        .collection('/users')
        .doc(_auth.currentUser!.uid)
        // .where("email", isEqualTo: "danish.bcss19@iba-suk.edu.pk")
        .get()
        .then((value) {
      setState(() {
        CurrentUserMap = value.data();
      });
    });
  }

  Future getImage() async {
    ImagePicker _picker = ImagePicker();

    await _picker.pickImage(source: ImageSource.gallery).then((xFile) {
      if (xFile != null) {
        imageFile = File(xFile.path);
        uploadImage();
      }
    });
  }

  Future uploadImage() async {
    String fileName = Uuid().v1();
    int status = 1;

    await _firestore
        .collection('chatroom')
        .doc(widget.chatRoomId)
        .collection('chats')
        .doc(fileName)
        .set({
      "sendby": CurrentUserMap!['uname'],
      "message": "",
      "type": "img",
      "time": FieldValue.serverTimestamp(),
    });

    var ref =
        FirebaseStorage.instance.ref().child('images').child("$fileName.jpg");

    var uploadTask = await ref.putFile(imageFile!).catchError((error) async {
      await _firestore
          .collection('chatroom')
          .doc(widget.chatRoomId)
          .collection('chats')
          .doc(fileName)
          .delete();

      status = 0;
    });

    if (status == 1) {
      String imageUrl = await uploadTask.ref.getDownloadURL();

      await _firestore
          .collection('chatroom')
          .doc(widget.chatRoomId)
          .collection('chats')
          .doc(fileName)
          .update({"message": imageUrl});

      print(imageUrl);
    }
  }

  void onSendMessage() async {
    if (_message.text.isNotEmpty) {
      Map<String, dynamic> messages = {
        "sendby": CurrentUserMap!['uname'],
        "message": _message.text,
        "type": "text",
        "time": FieldValue.serverTimestamp(),
      };

      _message.clear();
      await _firestore
          .collection('chatroom')
          .doc(widget.chatRoomId)
          .collection('chats')
          .add(messages);
    } else {
      print("Enter Some Text");
    }
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.chatColor,
        // title: Text(userMap!['uname']),
        title: Row(
          children: [
            BackButton(),
            const CircleAvatar(
              backgroundImage: AssetImage(
                "assets/images/profile.png",
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.userMap!['uname'],
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size.height / 1.25,
              width: size.width,
              child: StreamBuilder<QuerySnapshot>(
                  stream: _firestore
                      .collection('chatroom')
                      .doc(widget.chatRoomId)
                      .collection('chats')
                      .orderBy("time", descending: false)
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.data != null) {
                      return ListView.builder(
                          itemCount: snapshot.data?.docs.length,
                          itemBuilder: ((context, index) {
                            Map<String, dynamic> map =
                                snapshot.data!.docs[index].data()
                                    as Map<String, dynamic>;
                            return messages(size, map, context);
                          }));
                    } else {
                      return Container();
                    }
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      height: 50,
                      width: size.width / 1.35,
                      decoration: BoxDecoration(
                        color: AppColors.chatTextColor.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(right: 5.0, left: 5),
                              child: TextField(
                                controller: _message,
                                style:
                                    TextStyle(color: AppColors.chatTextColor),
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.color
                                        ?.withOpacity(0.64),
                                    onPressed: (() {
                                      getImage();
                                    }),
                                    icon: Icon(Icons.camera_alt_outlined),
                                  ),
                                  hintText: "Type Message",
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Material(
                    child: GestureDetector(
                      onTap: onSendMessage,
                      child: Icon(
                        Icons.send,
                        color: AppColors.chatColor.withOpacity(0.64),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget messages(Size size, Map<String, dynamic> map, BuildContext context) {
    return map['type'] == "text"
        ? Container(
            width: size.width,
            alignment: map['sendby'] == CurrentUserMap!['uname']
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.chatColor.withOpacity(0.64)),
              child: Text(
                map['message'],
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          )
        : Container(
            height: size.height / 2.5,
            width: size.width,
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            alignment: map['sendby'] == CurrentUserMap!['uname']
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: InkWell(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => ShowImage(
                    imageUrl: map['message'],
                  ),
                ),
              ),
              child: Container(
                height: size.height / 2.5,
                width: size.width / 2,
                decoration: BoxDecoration(border: Border.all()),
                alignment: map['message'] != "" ? null : Alignment.center,
                child: map['message'] != ""
                    ? Image.network(
                        map['message'],
                        fit: BoxFit.cover,
                      )
                    : CircularProgressIndicator(),
              ),
            ),
          );
  }
}

class ShowImage extends StatelessWidget {
  final String imageUrl;

  const ShowImage({required this.imageUrl, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        color: Colors.black,
        child: Image.network(imageUrl),
      ),
    );
  }
}
