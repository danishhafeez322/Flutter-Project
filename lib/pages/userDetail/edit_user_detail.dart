import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:mad_project/core/constant/app_color.dart';
import 'package:mad_project/core/constant/app_text.dart';
import 'package:mad_project/product/widget/custom_elevated_button.dart';
import 'package:mad_project/product/widget/custom_textfield.dart';
import 'package:mad_project/widgets/AppBar.dart';

import '../categorybottombar.dart';


class EditUserDetailView extends StatelessWidget {
  final name, address, city, email, phone;



  
  const EditUserDetailView({Key? key, this.name, this.address, this.city, this.email, this.phone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: _body(context),
    );
  }

  Stack _body(BuildContext context) {
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
                  hinttext: AppText.firstName,
                  text: name,
                  prefixIcon: const Icon(
                    Icons.person,
                    color: AppColors.loginColor,
                  ),
                ),
                context.emptySizedHeightBoxLow,
                CustomTextField(
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
              ],
            ),
          ),
        ),        
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CategoryBottomBar(),
          )
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
        style: context.textTheme.headline5!.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}