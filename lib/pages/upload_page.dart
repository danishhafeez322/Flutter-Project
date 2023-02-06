import 'package:flutter/material.dart';
import 'package:mad_project/core/constant/app_color.dart';
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
    return WillPopScope(
      onWillPop: () {
        Navigator.pushNamed(context, "/welcome");
        return Future.value(false);
      },
      child: Scaffold(
        bottomNavigationBar: CategoryBottomBar(),
        body: Stack(
          children: [
            DefaultTabController(
              length: 4,
              child: Scaffold(
                appBar: const LesseeAppBar(),
                body: const TabBarView(
                  children: <Widget>[
                    PostedItems(),
                    GivenItem(),
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
            // Positioned(
            //   bottom: 0,
            //   left: 0,
            //   right: 0,
            //   child: CategoryBottomBar(),
            // )
          ],
        ),
      ),
    );
  }
}
