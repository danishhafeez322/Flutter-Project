import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mad_project/pages/WelcomePage.dart';
import 'package:mad_project/pages/login_view.dart';
import 'package:mad_project/pages/upload_page.dart';
import 'package:mad_project/pages/userDetail/user_view.dart';
import 'package:mad_project/screens/chats/chats_screen.dart';
import 'package:mad_project/widgets/Search.dart';

final navigatorKey = GlobalKey<NavigatorState>();
Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
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
    debugShowCheckedModeBanner: false,
    routes: {
      "login": (context) => LoginView(),
      "/": (context) => SplashPage(gotoPage: HomePage(), duration: 1),
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
  final gotoPage;
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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentTab = 0;
  late WelcomePage welcomePage;
  late ChatsScreen chatScreen;
  late UploadPage uploadPage;
  late ProfilePage profilePage;
  late List<Widget> pages;
  late Widget currentPage;

  @override
  void initState() {
    welcomePage = WelcomePage();
    chatScreen = ChatsScreen();
    uploadPage = UploadPage();
    profilePage = ProfilePage();
    pages = [welcomePage, chatScreen, uploadPage, profilePage];

    currentPage = welcomePage;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentTab,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentTab,
          onTap: (int index) {
            currentTab = index;
            setState(() {});
          },
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chats'),
            BottomNavigationBarItem(
                icon: Icon(Icons.upload_file_outlined), label: 'upload'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline_outlined), label: 'Profile')
          ]),
    );
  }
}
