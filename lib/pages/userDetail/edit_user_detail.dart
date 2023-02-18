import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:mad_project/core/constant/app_color.dart';
import 'package:mad_project/core/constant/app_text.dart';
import 'package:mad_project/product/widget/custom_elevated_button.dart';
import 'package:mad_project/product/widget/custom_textfield.dart';
import 'package:mad_project/widgets/AppBar.dart';

import '../categorybottombar.dart';

class EditUserDetailView extends StatefulWidget {
  String name, address, city, email, phone;
  EditUserDetailView(
      {Key? key,
      required this.name,
      required this.address,
      required this.city,
      required this.email,
      required this.phone})
      : super(key: key);

  @override
  State<EditUserDetailView> createState() => _EditUserDetailViewState();
}

class _EditUserDetailViewState extends State<EditUserDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: _body(context,
          name: widget.name,
          address: widget.address,
          city: widget.city,
          email: widget.email,
          phone: widget.phone),
    );
  }

  Stack _body(BuildContext context,
      {required String name,
      required String address,
      required String city,
      required String email,
      required String phone}) {
    final controllerName = TextEditingController();
    final controllerAddress = TextEditingController();
    final controllerCity = TextEditingController();
    final controllerEmail = TextEditingController();
    final controllerContact = TextEditingController();
    controllerName.text = name;
    controllerAddress.text = address;
    controllerCity.text = city;
    controllerEmail.text = email;
    controllerContact.text = phone;
    return Stack(
      children: [
        SizedBox(
          height: context.height * 1,
          width: context.width * 1,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // context.emptySizedHeightBoxLow3x,
                // context.emptySizedHeightBoxLow3x,
                topText(context),
                context.emptySizedHeightBoxLow3x,
                CustomTextField(
                  controller: controllerName,
                  height: context.height * 0.07,
                  width: context.width * 0.8,
                  hinttext: AppText.uname,
                  text: name,
                  prefixIcon: const Icon(
                    Icons.person,
                    color: AppColors.loginColor,
                  ),
                ),
                context.emptySizedHeightBoxLow,
                CustomTextField(
                  controller: controllerEmail,
                  height: context.height * 0.07,
                  width: context.width * 0.8,
                  hinttext: AppText.email,
                  text: email,
                  prefixIcon: const Icon(
                    Icons.email,
                    color: AppColors.loginColor,
                  ),
                ),
                context.emptySizedHeightBoxLow,
                CustomTextField(
                  controller: controllerAddress,
                  height: context.height * 0.07,
                  width: context.width * 0.8,
                  hinttext: AppText.address,
                  text: address,
                  prefixIcon: const Icon(
                    Icons.location_city,
                    color: AppColors.loginColor,
                  ),
                ),
                context.emptySizedHeightBoxLow,
                CustomTextField(
                  controller: controllerCity,
                  height: context.height * 0.07,
                  width: context.width * 0.8,
                  hinttext: AppText.city,
                  text: city,
                  prefixIcon: const Icon(
                    Icons.home,
                    color: AppColors.loginColor,
                  ),
                ),
                context.emptySizedHeightBoxLow,
                CustomTextField(
                  controller: controllerContact,
                  height: context.height * 0.07,
                  width: context.width * 0.8,
                  hinttext: AppText.contact,
                  text: phone,
                  prefixIcon: const Icon(
                    Icons.phone,
                    color: AppColors.loginColor,
                  ),
                ),
                context.emptySizedHeightBoxLow3x,
                CustomElevatedButton(
                  onPressed: () async {
                    // final user = User(
                    //   id: "my id",
                    //   name: "my name",
                    //   address: "my address",
                    //   city: "my city",
                    //   email: "my email",
                    //   contact_no: 789456123,
                    //   cnic: 6789456123,
                    //   password: " my password",
                    //   isLogin: false,
                    //   isVerified: false,
                    //   rating: 5,
                    //   );
                    // updateUser(user:user);
                    final docUser = await FirebaseFirestore.instance
                        .collection('/users')
                        .doc(FirebaseAuth.instance.currentUser?.uid);
                    docUser.update({
                      'uname': controllerName.text,
                      'email': controllerEmail.text,
                      'address': controllerAddress.text,
                      'city': controllerCity.text,
                      'contact_no': int.parse(controllerContact.text)
                    });

                    Navigator.pop(context);
                  },
                  child: Text(
                    AppText.signUp.toUpperCase(),
                    style: const TextStyle(color: Colors.white),
                  ),
                  borderRadius: 20,
                  color: AppColors.loginColor,
                  height: context.height * 0.07,
                  width: context.width * 0.6,
                ),
                context.emptySizedHeightBoxLow3x,
                context.emptySizedHeightBoxLow3x,
                context.emptySizedHeightBoxLow3x,
              ],
            ),
          ),
        ),
        // Positioned(
        //     bottom: 0,
        //     left: 0,
        //     right: 0,
        //     child: CategoryBottomBar(),
        //   )
      ],
    );
  }

  Container topText(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 5, right: 5),
      height: context.height * 0.06,
      width: context.width * 1,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        color: AppColors.loginColor,
      ),
      alignment: Alignment.center,
      child: Text(
        AppText.edit.toUpperCase(),
        style: context.textTheme.headline5!
            .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }

  Future updateUser({required User user}) async {}
}

class User {
  String id;
  final String name;
  final String email;
  final String address;
  final String city;
  final int contact_no;
  // final int rating;
  // final bool isLogin;
  // final bool isVerified;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
    required this.city,
    required this.contact_no,
    // required this.rating,
    // required this.isLogin,
    // required this.isVerified,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'address': address,
      'city': city,
      'contact_no': contact_no,
      // 'isLogin': isLogin,
      // 'isVerified': isVerified,
      // 'rating': rating,
    };
  }
}
