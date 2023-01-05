// create Verifyview Email Page in Flutter and firebase???

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:mad_project/core/constant/app_color.dart';
import 'package:mad_project/pages/login_view.dart';
import 'package:mad_project/product/widget/custom_elevated_button.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({Key? key}) : super(key: key);

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
  
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  bool isEmailVerified = false;
  bool canResendEmail = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    if(!isEmailVerified)  {
      checkUserVerified();
      
    }
    timer = Timer.periodic(const Duration(seconds: 3), (timer) async{
      await FirebaseAuth.instance.currentUser!.reload();
      if(FirebaseAuth.instance.currentUser!.emailVerified) {
        timer.cancel();
        setState(() {
          isEmailVerified = true;
        });
      }
    });
  }
    Future checkUserVerified() async {
      try {
        FirebaseAuth.instance.currentUser!.sendEmailVerification();
        setState(() => canResendEmail = false);
        await Future.delayed(const Duration(seconds: 5));
        setState(() {
          canResendEmail = true;
        });

      } catch (e) {
        print(e);
      }
    }
  @override
  Widget build(BuildContext context)  => isEmailVerified ? LoginView() : Scaffold(
      appBar: AppBar(
        title: const Text('Verify Email'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('A verification email has been sent to ${FirebaseAuth.instance.currentUser!.email}',
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20,),
            Text('Please verify your email to continue',
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,),
            const SizedBox(height: 20,),
            CustomElevatedButton(
              onPressed: canResendEmail ? () async {
                await FirebaseAuth.instance.currentUser!.sendEmailVerification();
              } : null,
              child: const Text(
                'Resend Email',
                style: const TextStyle(color: Colors.white),),
              borderRadius: 20,
              color: AppColors.loginColor,
              height: context.height * 0.07,
              width: context.width * 0.6,
            ),

            
          ],
        ),
      ),
    );
}
  
 























