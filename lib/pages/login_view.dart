import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:mad_project/core/constant/app_color.dart';
import 'package:mad_project/core/constant/app_text.dart';
import 'package:mad_project/product/widget/custom_elevated_button.dart';
import 'package:mad_project/product/widget/custom_textfield.dart';
import 'Registorpage.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
  
}
class _MyAppState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }
}

  SizedBox _body(BuildContext context) {
    return SizedBox(
      height: context.height * 1,
      width: context.width * 1,
      child: SingleChildScrollView(
        child: Column(
          children: [
            context.emptySizedHeightBoxLow3x,
            topImage(context),
            context.emptySizedHeightBoxLow3x,
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
            ),
            context.emptySizedHeightBoxLow,
            CustomTextField(
              
              height: context.height * 0.07,
              width: context.width * 0.8,
              hinttext: AppText.password,
              prefixIcon: const Icon(
                Icons.lock,
                color: AppColors.loginColor,
              ),
              suffixIcon: const Icon(Icons.remove_red_eye),
            ),
            context.emptySizedHeightBoxLow,
            context.emptySizedHeightBoxLow3x,
            context.emptySizedHeightBoxLow3x,
            CustomElevatedButton(
              child: Text(
                
                AppText.login.toUpperCase(),
                style: const TextStyle(color: Colors.white),
              ),
              borderRadius: 20,
              color: AppColors.loginColor,
              height: context.height * 0.07,
              width: context.width * 0.6,
            ),
            bottomText(context),
          ],
        ),
      ),
    );
  }

  SizedBox topImage(BuildContext context) {
    return SizedBox(
      height: context.height * 0.2,
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
        AppText.login.toUpperCase(),
        style: context.textTheme.headline5!.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }

  SizedBox bottomText(BuildContext context) {
    return SizedBox(
      width: context.width * 0.7,
      height: context.height * 0.08,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            AppText.account,
          ),
          TextButton(
            child: const Text(
              AppText.registernow,
              style: TextStyle(color: AppColors.loginColor),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RegisterView()),
              );
            },
          )
        ],
      ),
    );
  }
