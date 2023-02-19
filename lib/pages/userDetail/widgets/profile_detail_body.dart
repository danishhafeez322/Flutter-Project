import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mad_project/core/constant/app_color.dart';
import 'package:mad_project/main.dart';

import '../../Registorpage.dart';
import '../../WelcomePage.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({Key? key}) : super(key: key);
  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  MyUser currentUser = MyUser(
      uname: "User Name",
      email: "abc@xyz",
      contact_no: "",
      address: " ",
      city: " ",
      cnic: "",
      isLogin: true,
      isVerified: true,
      rating: 0);

  // var currentUser;
  Future<void> myCurrentUser() async {
    final docUser = await FirebaseFirestore.instance
        .collection('/users')
        .doc(FirebaseAuth.instance.currentUser!.uid);
    final doc = await docUser.get();
    if (doc.exists) {
      // MyUser temp = MyUser.fromMap(doc.data() as Map<String, dynamic>);
      currentUser = MyUser.fromMap(doc.data() as Map<String, dynamic>);
    } else {
      currentUser = MyUser(
          uname: "User name",
          email: "Email",
          contact_no: "",
          address: "MyAddress",
          city: "city",
          cnic: "",
          isLogin: true,
          isVerified: true,
          rating: 0);
    }
    // print("hello ${currentUser.uname}1 1 1 1 1 1 1 1 1 1 1 1 1 ==========================================1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1");
    setState(() {});
  }

  void initState() {
    super.initState();
    myCurrentUser();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // myCurrentUser();

    return Expanded(
        child: Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: ListView(children: [
              Row(
                children: [
                  const Icon(
                    Icons.person,
                    color: AppColors.chatColor,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(currentUser.uname,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      )),
                ],
              ),
              Divider(
                color: Colors.black54,
                thickness: 1,
                height: 20,
                indent: 10,
                endIndent: 10,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.email,
                    color: AppColors.chatColor,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    currentUser.email,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Divider(
                color: Colors.black87,
                thickness: 1,
                height: 20,
                indent: 10,
                endIndent: 10,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.phone,
                    color: AppColors.chatColor,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(currentUser.contact_no,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      )),
                ],
              ),
              Divider(
                color: Colors.black54,
                thickness: 1,
                height: 20,
                indent: 10,
                endIndent: 10,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.location_city,
                    color: AppColors.chatColor,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    currentUser.address,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Divider(
                color: Colors.black54,
                thickness: 1,
                height: 20,
                indent: 10,
                endIndent: 10,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    color: AppColors.chatColor,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    currentUser.city,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Divider(
                color: Colors.black54,
                thickness: 1,
                height: 20,
                indent: 10,
                endIndent: 10,
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return HomePage();
                  }), (r) {
                    return false;
                  });
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.logout,
                      color: AppColors.chatColor,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Logout',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    // ),
                  ],
                ),
              ),
            ])));
  }
}
