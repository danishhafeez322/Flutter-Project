import 'package:flutter/material.dart';
import 'package:mad_project/widgets/AppBar.dart';
import 'package:mad_project/widgets/MyDrawerHeader.dart';

import 'categorybottombar.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _settingsState();
}

class _settingsState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: MainAppBar(),
      body: Container(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                height: 900,
                child: Column(
                  children: [MyDrawerHeader(), MyDrawerList()],
                ),
              ),
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

Widget MyDrawerList() {
  var currentPage;
  return Container(
    padding: EdgeInsets.only(top: 15),
    child: Column(
      children: [
        MenuItems(1, "Become a lessor", Icons.person_search_outlined,
            currentPage == DrawerSection.lessor ? true : false),
        MenuItems(2, "Contact us", Icons.people_alt_outlined,
            currentPage == DrawerSection.contacts ? true : false),
        MenuItems(3, "Events", Icons.event,
            currentPage == DrawerSection.events ? true : false),
        MenuItems(4, "Privacy policy", Icons.privacy_tip,
            currentPage == DrawerSection.privacy_policy ? true : false),
        MenuItems(5, "Send feedback", Icons.feedback_outlined,
            currentPage == DrawerSection.send_feedback ? true : false),
        MenuItems(6, "Logout", Icons.logout_outlined,
            currentPage == DrawerSection.logout ? true : false),
      ],
    ),
  );
}

class MenuItems extends StatelessWidget {
  int id;
  String title;
  IconData icon;
  bool selected;
  MenuItems(this.id, this.title, this.icon, this.selected);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          // if (id == 1) {
          //   Navigator.push(
          //       context, MaterialPageRoute(builder: (context) => Lessor()));
          // }
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSection {
  contacts,
  events,
  lessor,
  privacy_policy,
  send_feedback,
  logout,
}
