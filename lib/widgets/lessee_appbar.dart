import 'package:flutter/material.dart';
import 'package:mad_project/core/constant/app_color.dart';
import 'package:mad_project/widgets/tabs.dart';

class LesseeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LesseeAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(100.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
                onPressed: (() {}),
              ),
            ),
          ),
        ),
      ],
      bottom: TabBar(
        indicatorColor: AppColors.uploadColor,
        indicatorWeight: 3.5,
        labelColor: AppColors.uploadColor,
        unselectedLabelColor: Colors.black,
        tabs: const <Widget>[
          MyTabs(text: 'Posted'),
          MyTabs(text: 'Given'),
          MyTabs(text: 'Rented'),
        ],
      ),
    );
  }
}
