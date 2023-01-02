import 'package:flutter/material.dart';
import 'package:mad_project/models/category.dart';
import 'package:mad_project/widgets/AppBar.dart';
import 'package:mad_project/pages/New%20Arrival.dart';
import 'package:mad_project/pages/categorybottombar.dart';
import 'package:mad_project/pages/categorycard.dart';
import 'package:mad_project/pages/selectedcategory.dart';
import 'package:mad_project/users/lessor.dart';
import 'package:mad_project/widgets/Carousel.dart';
import 'package:mad_project/widgets/MyDrawerHeader.dart';
import 'package:firebase_core/firebase_core.dart';
import 'helper/utils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

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
            height: 1000,
            child: Column(
              children: [MyDrawerHeader(), MyDrawerList()],
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      appBar: MainAppBar(),
      body: Container(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 10,
                      bottom: 15,
                    ),
                    child: Container(
                      height: 50,
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: TextField(
                        maxLines: 1,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          hintText: 'Find Cars, Vehicles, and many more',
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        height: 180,
                        child: Carousel(),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, bottom: 6, top: 10),
                    child: Text(
                      "Main Categories",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: 80,
                    child: Expanded(
                      child: Container(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,

                          // padding: const EdgeInsets.only(bottom: 100),
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
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, bottom: 8, top: 10),
                    child: Text(
                      "New Arrival",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  NewArrival(selectedCategory: categories[1]),
                ],
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
