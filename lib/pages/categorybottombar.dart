import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mad_project/pages/upload_page.dart';

import '../helper/utils.dart';
import '../models/category.dart';
import 'login_view.dart';

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
      height: 65,
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ClipOval(
            child: Material(
              child: IconButton(
                icon: const Icon(Icons.home_rounded, color: Colors.black54),
                onPressed: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => WelcomePage()));
                  Navigator.popAndPushNamed(context, "/welcome");
                },
              ),
            ),
          ),
          ClipOval(
            child: Material(
              child: IconButton(
                icon: const Icon(Icons.message_rounded, color: Colors.black54),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, "/chatScreen");
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => ChatsScreen()));
                  // Navigator.pushNamed(context, "/chatScreen");
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
                    MaterialPageRoute(builder: (context) => UploadPage())
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                        StreamBuilder<User?>(
                          stream: FirebaseAuth.instance
                              .authStateChanges(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return UploadPage();
                            }
                            return LoginView();
                          }
                        )
                    )
                  );
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
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => ProfilePage()));
                  Navigator.popAndPushNamed(context, "/profilePage");
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
