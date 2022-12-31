import 'package:flutter/material.dart';
import 'package:mad_project/core/constant/app_color.dart';
import 'package:mad_project/pages/upload.dart';

import '../widgets/lessee_appbar.dart';
import '../widgets/rented_item.dart';
import '../widgets/posted_item.dart';
import '../widgets/given_item.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<UploadPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: const LesseeAppBar(),
        body: const TabBarView(
          children: <Widget>[
            PostedItems(),
            GivenItem(),
            RentedItem(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => UploadView()));
          },
          child: Icon(Icons.add),
          backgroundColor: AppColors.uploadColor,
        ),
      ),
    );
  }
}
