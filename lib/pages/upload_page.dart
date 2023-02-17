import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mad_project/core/constant/app_color.dart';
import 'package:mad_project/pages/login_view.dart';
import 'package:mad_project/pages/upload.dart';

import '../widgets/booked_item.dart';
import '../widgets/lessee_appbar.dart';
import '../widgets/rented_item.dart';
import '../widgets/posted_item.dart';
import '../widgets/given_item.dart';
import 'categorybottombar.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<UploadPage> {
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
          return rentItem();
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

class rentItem extends StatefulWidget {
  const rentItem({super.key});

  @override
  State<rentItem> createState() => _rentItemState();
}

class _rentItemState extends State<rentItem> {
  DateTime timeBackPressed = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        DateTime now = DateTime.now();
        if (now.difference(timeBackPressed) > Duration(seconds: 2)) {
          timeBackPressed = now;
          Fluttertoast.showToast(msg: "Press back again to exit", fontSize: 16);
          return false;
        }
        exit(0);
        //return true;
      },
      child: Scaffold(
        body: Stack(
          children: [
            DefaultTabController(
              length: 3,
              child: Scaffold(
                appBar: const LesseeAppBar(),
                body: const TabBarView(
                  children: <Widget>[
                    PostedItems(),
                    // GivenItem(),
                    RentedItem(),
                    BookedItem(),
                  ],
                ),
                floatingActionButton: Padding(
                  padding: const EdgeInsets.only(bottom: 60.0),
                  child: FloatingActionButton(
                    onPressed: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UploadView()));
                    },
                    child: Icon(Icons.add),
                    backgroundColor: AppColors.uploadColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
