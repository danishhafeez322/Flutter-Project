import 'package:flutter/material.dart';
import 'package:mad_project/widgets/AppBar.dart';

import '../categorybottombar.dart';
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
    return WillPopScope(
      onWillPop: () {
        Navigator.pushNamed(context, "/welcome");
        return Future.value(false);
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
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: CategoryBottomBar(),
            )
          ],
        ),
      ),
    );
  }
}
