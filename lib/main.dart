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
              children: [MyDrawerHeader()],
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
