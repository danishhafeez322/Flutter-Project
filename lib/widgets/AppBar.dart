import 'package:flutter/material.dart';

import '../pages/notification/notification_main.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  Size get preferredSize => const Size.fromHeight(50);
  bool flag;
  MainAppBar({super.key, this.flag = true});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: flag,
      title: const Text(
        "Rent it",
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      iconTheme: const IconThemeData(color: Colors.black),
      actions: [
        Container(
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.only(right: 5),
          child: ClipOval(
            child: Material(
              child: IconButton(
                icon: Icon(Icons.notifications),
                onPressed: (() {
                  Navigator.push(context,
                            MaterialPageRoute(builder: (context) => MyNotification()));
                }),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
