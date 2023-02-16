import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../pages/Registorpage.dart';

class AppText {
  static const String login = "Login";
  static const String signUp = "Sign Up";
  static const String email = "Email";
  static const String send = "Send";
  static const String password = "Password";
  static const String uname = "Username";
  static const String contact = "Contact";
  static const String cnic = "CNIC";
  static const String city = "City";
  static const String address = "Address";
  static const String confirm = "Confirm Password";
  static const String rememberMe = "Remember Me";
  static const String forgotPassword = "Forgot Password";
  static const String account = "Don't have an account?";
  static const String already = "Already have an account?";
  static const String registernow = "Register Now";
  static const String loginwith = "Log in with";
  static const String or = "OR";

  static const String edit = "Edit Details";

  static const String upload = "Upload";
  static const String rentit = "Rent It";
  static const String ChatNow = "Chat Now";
  static const String title = "Title";
  static const String categories = "Categories";
  static const String price = "Rent Price";
  static const String guaranteeprice = "Gaurantee Price";
  static const String days = "Days";
  static const String description = "Description";
  static const String quantity = "Quantity";
  static MyUser currentUser = MyUser(
      uname: "User Name",
      email: "abc@xyz",
      contact_no: '',
      address: "address",
      city: "city",
      cnic: '',
      isLogin: true,
      isVerified: true,
      rating: 0);
  // static int count = 4;
  // static const List<String> list = <String>[
  // static MyUser currentUser = MyUser(uname: "User Name", email: "abc@xyz", contact_no: 0, address: "address", city: "city", cnic: 0, isLogin: true, isVerified: true, rating: 0);
  static int count = 7;
  static const List<String> list = <String>[
    'Fashion',
    'Electronics',
    'Automobiles',
    'Crockery',
    'Sports'
  ];
  static const List<String> fashion_sub_list = <String>[
    'Mens',
    'womens',
    'Kids'
  ];

  static const List<String> electronics_sub_list = <String>[
    'Home Appliances',
    'Gadgets',
  ];

  static var cate = "";

  void myCurrentUser() async {
    final docUser = await FirebaseFirestore.instance
        .collection('/users')
        .doc(FirebaseAuth.instance.currentUser!.uid);
    final doc = await docUser.get();
    currentUser = MyUser.fromMap(doc.data() as Map<String, dynamic>);
  }
  // myCurrentUser();

}
