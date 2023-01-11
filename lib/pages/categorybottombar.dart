import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mad_project/pages/upload_page.dart';
import 'package:mad_project/pages/userDetail/user_view.dart';
import 'package:mad_project/screens/chats/chats_screen.dart';

import '../helper/utils.dart';
import '../main.dart';
import '../models/category.dart';
import 'Registorpage.dart';

class CategoryBottomBar extends StatelessWidget {
  List<Category> categories = Utils.getMockedCategories();

  @override
  Widget build(BuildContext context) {
    // MyUser currentUser = MyUser(uname: "User Name", email: "abc@xyz", contact_no: 0, address: " ", city: " ", cnic: 0, isLogin: true,isVerified: true,rating: 0);
    // Future<void> myCurrentUser() async{

    //   final docUser = await FirebaseFirestore.instance.collection('/users').doc(FirebaseAuth.instance.currentUser!.uid);
    //   final doc = await docUser.get();
    //   if(doc.exists)
    //   {
    //     currentUser = MyUser.fromMap(doc.data() as Map<String, dynamic>);
    //   }
    //   else
    //   {
    //   currentUser = MyUser(uname: "User name", email: "Email", contact_no: 0, address: "MyAddress", city: "city", cnic: 0, isLogin: true,isVerified: true,rating: 0);

    //   }
    // }
    //                 myCurrentUser();

    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            blurRadius: 20,
            color: Colors.black.withOpacity(0.2),
            offset: Offset.zero),
      ]),
      height: 65,
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ClipOval(
            child: Material(
              child: IconButton(
                icon: const Icon(Icons.home_rounded, color: Colors.black54),
                onPressed: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => WelcomePage()));
                  Navigator.popAndPushNamed(context, "/welcome");
                },
              ),
            ),
          ),
          ClipOval(
            child: Material(
              child: IconButton(
                icon: const Icon(Icons.message_rounded, color: Colors.black54),
                onPressed: () {
                  Navigator.popAndPushNamed(context, "/chatScreen");
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => ChatsScreen()));
                  // Navigator.pushNamed(context, "/chatScreen");
                },
              ),
            ),
          ),
          ClipOval(
            child: Material(
              child: IconButton(
                icon: const Icon(Icons.file_upload_outlined,
                    color: Colors.black54),
                onPressed: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => UploadPage()));
                  Navigator.popAndPushNamed(context, "/uploadPage");
                },
              ),
            ),
          ),
          ClipOval(
            child: Material(
              child: IconButton(
                icon: const Icon(Icons.person_outline_outlined,
                    color: Colors.black54),
                onPressed: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => ProfilePage()));
                  Navigator.popAndPushNamed(context, "/profilePage");
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
