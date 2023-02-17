import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mad_project/widgets/AppBar.dart';

import '../categorybottombar.dart';
import '../login_view.dart';
import 'widgets/profile_detail.dart';
import 'widgets/profile_detail_body.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
          return MyProfile();
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

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
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
      },
      child: Scaffold(
        appBar: MainAppBar(),
        body: Stack(
          children: [
            Column(
              children: [
                ProfileHeader(),
                ProfileBody(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
