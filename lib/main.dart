import 'package:flutter/material.dart';
import 'package:mad_project/models/category.dart';
import 'package:mad_project/pages/categorybottombar.dart';
import 'package:mad_project/pages/categorycard.dart';
import 'package:mad_project/pages/selectedcategory.dart';
import 'package:mad_project/pages/userdetails.dart';
import 'package:mad_project/users/lessor.dart';
import 'package:mad_project/widgets/MyDrawerHeader.dart';

import 'helper/utils.dart';

void main() {
  runApp(MaterialApp(
      //debugShowCheckedModeBanner: false,
      home: SplashPage(duration: 3, gotoPage: WelcomePage())));
}

class SplashPage extends StatelessWidget {
  int duration = 0;
  Widget gotoPage;
  SplashPage({required this.gotoPage, required this.duration});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: this.duration), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => this.gotoPage));
    });

    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 15, 12, 12),
        alignment: Alignment.center,
        child: Image.asset(
          "assets/images/rentit_logo.png",
          height: 150,
          width: 150,
        ),
      ),
    );
  }
}

class WelcomePage extends StatelessWidget {
  List<Category> categories = Utils.getMockedCategories();

  @override
  Widget build(Object context) {
    return Scaffold(
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [MyDrawerHeader(), MyDrawerList()],
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      appBar: AppBar(
        title: const Text(
          "Rent itt",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(right: 5),
            child: ClipOval(
              child: Image.asset("assets/images/danish.jpeg"),
            ),
          ),
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                  ),
                  // child: Text(
                  //   "Select any Category",
                  //   style: TextStyle(
                  //       color: Colors.redAccent,
                  //       fontWeight: FontWeight.bold,
                  //       fontSize: 20),
                  // ),
                  child: Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: TextField(
                      maxLines: 1,
                      //controller: emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        //labelText: 'Email',
                        hintText: 'Find Cars, Vehicles, and many more',
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: ListView.builder(
                  //scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(bottom: 120),
                  itemCount: categories.length,
                  itemBuilder: (BuildContext ctx, int index) {
                    return Categorycard(
                        category: categories[index],
                        onCardClick: () {
                          Navigator.push(
                            ctx,
                            MaterialPageRoute(
                              builder: (context) => SelectedCategory(
                                  selectedCategory: categories[index]),
                            ),
                          );
                        });
                  },
                ))
              ],
            ),
            const Positioned(
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
  var currentPage = DrawerSection.lessor;
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
          if (id == 1) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Lessor()));
          }
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
}
