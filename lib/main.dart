import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mad_project/models/category.dart';
import 'package:mad_project/pages/login_view.dart';
import 'package:mad_project/pages/myTemp.dart';
import 'package:mad_project/pages/upload_page.dart';
import 'package:mad_project/pages/userDetail/user_view.dart';
import 'package:mad_project/screens/ChatRoom.dart';
import 'package:mad_project/screens/chats/chats_screen.dart';
import 'package:mad_project/widgets/AppBar.dart';
import 'package:mad_project/pages/New%20Arrival.dart';
import 'package:mad_project/pages/categorybottombar.dart';
import 'package:mad_project/pages/categorycard.dart';
import 'package:mad_project/pages/selectedcategory.dart';
import 'package:mad_project/widgets/Carousel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mad_project/widgets/Search.dart';
import 'helper/utils.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

// import 'dart:js';

final navigatorKey = GlobalKey<NavigatorState>();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyC6NfsibyVq_SdJo4Ik92blqHnIp4AkPzE",
            authDomain: "rent-it-project-b4509.firebaseapp.com",
            projectId: "rent-it-project-b4509",
            storageBucket: "rent-it-project-b4509.appspot.com",
            messagingSenderId: "333982864118",
            appId: "1:333982864118:web:a85470cc69feffda05d2d7"));
  } else {
    await Firebase.initializeApp();
  }
  runApp(MaterialApp(
    navigatorKey: navigatorKey,
    // //debugShowCheckedModeBanner: false,
    // home: SplashPage(duration: 3, gotoPage: WelcomePage()),
    routes: {
      "login": (context) => LoginView(),
      "/": (context) => SplashPage(gotoPage: WelcomePage(), duration: 1),
      "/welcome": (context) => WelcomePage(),
      "/chatScreen": (context) => ChatsScreen(),
      "/uploadPage": (context) => UploadPage(),
      "/profilePage": (context) => ProfilePage(),
      "/searchPage": (context) => SearchPage(),
    },
    initialRoute: "/",
  ));
}

class SplashPage extends StatelessWidget {
  int duration = 0;
  Widget gotoPage;
  SplashPage({required this.gotoPage, required this.duration});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: this.duration), () {
      // Navigator.pop(context);

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => this.gotoPage));
    });

    return Scaffold(
      body: Container(
        color: Colors.white,
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
        builder: (BuildContext context) => CupertinoAlertDialog(
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
        bottomNavigationBar: CategoryBottomBar(),
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
                      height: 180,
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
                                // Navigator.pop(ctx);
                                Navigator.push(
                                  ctx,
                                  MaterialPageRoute(
                                    builder: (context) => 
                                    SelectedCategory(
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
                Padding(
                  padding: const EdgeInsets.only(left: 16, bottom: 8, top: 10),
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
        ),
      ),
    );
  }
}

void getSearch(context) {
  Navigator.pushNamed(context, "/searchPage");
}
