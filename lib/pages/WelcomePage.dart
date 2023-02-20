import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mad_project/pages/selectedcategory.dart';

import '../helper/utils.dart';
import '../models/category.dart';
import '../widgets/AppBar.dart';
import '../widgets/Carousel.dart';
import 'New Arrival.dart';
import 'categorycard.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class WelcomePage extends StatefulWidget {
  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List<Category> categories = Utils.getMockedCategories();

  DateTime timeBackPressed = DateTime.now();
  late StreamSubscription subscription;
  var isDeviceConnected = false;
  bool isAlertSet = false;

  @override
  void initState() {
    getConnectivity();
    super.initState();
  }

  getConnectivity() =>
      subscription = Connectivity().onConnectivityChanged.listen(
        (ConnectivityResult result) async {
          isDeviceConnected = await InternetConnectionChecker().hasConnection;
          if (!isDeviceConnected && isAlertSet == false) {
            showDialogBox();
            setState(() {
              isAlertSet = true;
            });
          }
        },
      );

  showDialogBox() => showCupertinoDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('No Connection'),
          content: const Text('Please check your internet connectivity'),
          actions: <Widget>[
            TextButton(
                onPressed: () async {
                  Navigator.pop(context, 'cancel');
                  setState(() {
                    isAlertSet = false;
                  });
                  isDeviceConnected =
                      await InternetConnectionChecker().hasConnection;
                  if (!isDeviceConnected) {
                    showDialogBox();
                    setState(() {
                      isAlertSet = true;
                    });
                  }
                },
                child: const Text('OK'))
          ],
        ),
      );

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  // initState() {
  @override
  Widget build(Object context) {
    return WillPopScope(
      onWillPop: () async {
        DateTime now = DateTime.now();
        if (now.difference(timeBackPressed) > Duration(seconds: 2)) {
          timeBackPressed = now;
          Fluttertoast.showToast(msg: "Press back again to exit", fontSize: 16);
          return false;
        }
        exit(0);
        //return true;
      },
      child: Scaffold(
        appBar: MainAppBar(
          flag: false,
        ),
        // bottomNavigationBar: CategoryBottomBar(),

        body: Container(
          child: SingleChildScrollView(
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
                      onTap: () {
                        getSearch(context);
                      },
                      maxLines: 1,
                      readOnly: true,
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
                      height: (kIsWeb) ? (300) : (180),
                      child: Carousel(),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, bottom: 6, top: 10),
                  child: Text(
                    "Main Categories",
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: (kIsWeb) ? (30) : (20),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Center(
                  child: Container(
                    height: (kIsWeb) ? (110) : (80),
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
                                  // Navigator.pop(ctx);
                                  Navigator.push(
                                    ctx,
                                    MaterialPageRoute(
                                      builder: (context) => SelectedCategory(
                                          selectedCategory: categories[index]),

                                      // MyCategory()
                                    ),
                                  );
                                });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, bottom: 8, top: 10),
                  child: Text(
                    "New Arrival",
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: (kIsWeb) ? (30) : (20),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                NewArrival(selectedCategory: categories[1]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void getSearch(context) {
  Navigator.pushNamed(context, "/searchPage");
}
