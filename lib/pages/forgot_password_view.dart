import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kartal/kartal.dart';
import 'package:mad_project/core/constant/app_color.dart';
import 'package:mad_project/core/constant/app_text.dart';
import 'package:mad_project/product/widget/custom_elevated_button.dart';
import 'package:mad_project/product/widget/custom_textfield.dart';



class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  Stack _body(BuildContext context) {
    final controllerEmail = TextEditingController();
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
                  height: context.height * 0.07,
                  width: context.width * 0.8,
                  hinttext: AppText.email,
                  prefixIcon: const Icon(
                    Icons.email,
                    color: AppColors.loginColor,
                  ), 
                  controller: controllerEmail,
                ),
                context.emptySizedHeightBoxLow,
                CustomElevatedButton(
                  height: context.height * 0.07,
                  width: context.width * 0.8,
                  onPressed: () => resetPassowrd(controllerEmail.text,context: context), 
                  child: Text(
                    AppText.send,
                    style: context.textTheme.headline6!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ),
                context.emptySizedHeightBoxLow3x,
              ],
            ),
          ),
        ),
      ],
    );
  }

  Text topText(BuildContext context) {
    return Text(
      AppText.forgotPassword,
      style: context.textTheme.headline4!.copyWith(
        color: AppColors.loginColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
  Future resetPassowrd(String email, {required BuildContext context}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      Fluttertoast.showToast(
        msg: "We have sent you instructions to reset your password. you can check your spam email",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
        msg: "Wrong email",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
      );
    }
  }
}






