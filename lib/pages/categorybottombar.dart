import 'package:flutter/material.dart';
import 'package:mad_project/pages/New%20Arrival.dart';
import 'package:mad_project/pages/settings.dart';
import 'package:mad_project/pages/upload.dart';

import '../helper/utils.dart';
import '../main.dart';
import '../models/category.dart';
import 'notifications.dart';

class CategoryBottomBar extends StatelessWidget {
  List<Category> categories = Utils.getMockedCategories();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            blurRadius: 20,
            color: Colors.black.withOpacity(0.2),
            offset: Offset.zero),
      ]),
      height: 70,
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ClipOval(
            child: Material(
              child: IconButton(
                icon: const Icon(Icons.home_rounded, color: Colors.black54),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WelcomePage()));
                },
              ),
            ),
          ),
          ClipOval(
            child: Material(
              child: IconButton(
                icon: const Icon(Icons.message_rounded, color: Colors.black54),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyApp()));
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UploadView()));
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => settings()));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
