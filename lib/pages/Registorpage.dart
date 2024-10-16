import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kartal/kartal.dart';
import 'package:mad_project/core/constant/app_color.dart';
import 'package:mad_project/core/constant/app_text.dart';
import 'package:mad_project/pages/verify_email_view.dart';
import 'package:mad_project/product/widget/custom_elevated_button.dart';
import 'package:mad_project/product/widget/custom_textfield.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    final controllerName = TextEditingController();
    final controllerAddress = TextEditingController();
    final controllerCity = TextEditingController();
    final controllerEmail = TextEditingController();
    final controllerContact = TextEditingController();
    final controllerCnic = TextEditingController();
    final controllerPassword = TextEditingController();
    final controllerConfirm = TextEditingController();
    bool _obscureText = true;

    return StatefulBuilder(
        builder: (context, setState) => SizedBox(
              height: context.height * 1,
              width: context.width * 1,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // context.emptySizedHeightBoxLow3x,
                    topImage(context),
                    // context.emptySizedHeightBoxLow3x,
                    topText(context),
                    context.emptySizedHeightBoxLow3x,
                    CustomTextField(
                      controller: controllerName,
                      height: context.height * 0.07,
                      width: context.width * 0.8,
                      hinttext: AppText.uname,
                      prefixIcon: const Icon(
                        Icons.person,
                        color: AppColors.loginColor,
                      ),
                    ),
                    context.emptySizedHeightBoxLow,
                    CustomTextField(
                      controller: controllerAddress,
                      height: context.height * 0.07,
                      width: context.width * 0.8,
                      hinttext: AppText.address,
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
                      prefixIcon: const Icon(
                        Icons.home,
                        color: AppColors.loginColor,
                      ),
                    ),
                    context.emptySizedHeightBoxLow,
                    CustomTextField(
                      controller: controllerEmail,
                      height: context.height * 0.07,
                      width: context.width * 0.8,
                      hinttext: AppText.email,
                      prefixIcon: const Icon(
                        Icons.email,
                        color: AppColors.loginColor,
                      ),
                    ),
                    context.emptySizedHeightBoxLow,
                    CustomTextField(
                      controller: controllerContact,
                      height: context.height * 0.07,
                      width: context.width * 0.8,
                      hinttext: AppText.contact,
                      prefixIcon: const Icon(
                        Icons.phone,
                        color: AppColors.loginColor,
                      ),
                    ),
                    context.emptySizedHeightBoxLow,
                    CustomTextField(
                      controller: controllerCnic,
                      height: context.height * 0.07,
                      width: context.width * 0.8,
                      hinttext: AppText.cnic,
                      prefixIcon: const Icon(
                        Icons.card_membership,
                        color: AppColors.loginColor,
                      ),
                    ),
                    context.emptySizedHeightBoxLow,
                    CustomTextField(
                      obscureText: _obscureText,
                      controller: controllerPassword,
                      height: context.height * 0.07,
                      width: context.width * 0.8,
                      hinttext: AppText.password + "(min 6 characters)",
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: AppColors.loginColor,
                      ),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },

                        /// This is Magical Function
                        child: Icon(
                          _obscureText
                              ?

                              /// CHeck Show & Hide.
                              Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                    ),
                    context.emptySizedHeightBoxLow,
                    CustomTextField(
                      obscureText: _obscureText,
                      controller: controllerConfirm,
                      height: context.height * 0.07,
                      width: context.width * 0.8,
                      hinttext: AppText.confirm,
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: AppColors.loginColor,
                      ),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },

                        /// This is Magical Function
                        child: Icon(
                          _obscureText
                              ?

                              /// CHeck Show & Hide.
                              Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                    ),
                    context.emptySizedHeightBoxLow3x,
                    CustomElevatedButton(
                      onPressed: () {
                        final user = MyUser(
                          uname: controllerName.text.trim(),
                          address: controllerAddress.text.trim(),
                          city: controllerCity.text.trim(),
                          email: controllerEmail.text.trim(),
                          contact_no: controllerContact.text.trim(),
                          cnic: controllerCnic.text.trim(),
                          isLogin: false,
                          isVerified: false,
                          rating: 5,
                        );
                        if (controllerPassword.text == controllerConfirm.text) {
                          createUser(
                              user: user,
                              context: context,
                              text: controllerPassword.text);
                        } else {
                          Fluttertoast.showToast(
                              msg: "password not match",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                          // print("password not match");
                        }
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
                    // context.emptySizedHeightBoxLow3x,
                    bottomText(context),
                  ],
                ),
              ),
            ));
  }

  SizedBox topImage(BuildContext context) {
    return SizedBox(
      child: Image.asset('assets/images/loginill.png'),
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
        AppText.signUp.toUpperCase(),
        style: context.textTheme.headlineMedium!
            .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }

  SizedBox bottomText(BuildContext context) {
    return SizedBox(
      width: context.width * 0.7,
      height: context.height * 0.08,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            AppText.already,
          ),
          TextButton(
            child: const Text(
              AppText.login,
              style: TextStyle(color: AppColors.loginColor),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }

  Future createUser(
      {required MyUser user,
      required BuildContext context,
      required String text}) async {
    // showDialog(
    //   context: context,
    //   barrierDismissible: false,
    //   builder: (context) => const Center(child: CircularProgressIndicator())
    // );
    try {
      if (user.email!.isEmpty) {
        Fluttertoast.showToast(
            msg: "Email is Empty",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: user.email!, password: text);
      final docUser = await FirebaseFirestore.instance
          .collection('/users')
          .doc(credential.user!.uid);

      final json = user.toMap();
      await docUser.set(json);
      AppText.count++;
      Fluttertoast.showToast(
          msg: "Account Created Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      print("object");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => VerifyEmailPage()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(
            msg:
                "The password provided is too weak./nPassword must be at least 6 characters",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        // print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
            msg: "The account already exists for that email.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        // print('The account already exists for that email.');
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: "This email already has an account" + e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      print(e);
    }
    // navigatorKey.currentState!.popUntil((!'login')=>route.isFirst());
  }

  Stream<List<MyUser>> getUsers() {
    final ref = FirebaseFirestore.instance.collection('/users');
    final snapshots = ref.snapshots();
    return snapshots.map((snapshot) =>
        snapshot.docs.map((doc) => MyUser.fromMap(doc.data())).toList());
  }
}

class MyUser {
  String? uname;
  String? email;
  String? address;
  String? city;
  String? contact_no;
  String? cnic;
  int? rating;
  bool? isLogin;
  bool? isVerified;

  MyUser({
    this.uname,
    this.email,
    this.address,
    this.city,
    this.contact_no,
    this.cnic,
    this.rating,
    this.isLogin,
    this.isVerified,
  });

  Map<String, dynamic> toMap() {
    return {
      'uname': uname,
      'email': email,
      'address': address,
      'city': city,
      'contact_no': contact_no,
      'cnic': cnic,
      'isLogin': isLogin,
      'isVerified': isVerified,
      'rating': rating,
    };
  }

  static MyUser fromMap(Map<String, dynamic> map) => MyUser(
        uname: map['uname'],
        email: map['email'],
        contact_no: map['contact_no'].toString(),
        cnic: map['cnic'].toString(),
        city: map['city'],
        address: map['address'],
        rating: map['rating'],
        isLogin: map['isLogin'],
        isVerified: map['isVerified'],
      );
}
