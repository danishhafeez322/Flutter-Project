import 'package:flutter/material.dart';
import 'package:mad_project/core/constant/app_color.dart';

import '../../../core/constant/constants.dart';

class ChatInputField extends StatelessWidget {
  const ChatInputField({Key? key}) : super(key: key);
  static const double myopacity = 0.08;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 2,
      ),
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 4),
              blurRadius: 32,
              color: AppColors.chatTextColor.withOpacity(0.08),
            ),
          ]),
      child: SafeArea(
        child: Row(
          children: [
            
            Expanded(
              child: Container(
                padding:
                const EdgeInsets.symmetric(horizontal: kDefaultPadding * 0.75),
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.chatTextColor.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: TextField(
                        style: TextStyle(color:AppColors.chatTextColor),
                        decoration: InputDecoration(
                          hintText: "Type Message",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    
                    Icon(
                      Icons.camera_alt_outlined,
                      color: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.color
                          ?.withOpacity(0.64),
                    ),
                  ],
                ),
              ),
            ),
            Icon(
              Icons.send,
              color: AppColors.chatColor.withOpacity(0.64),
            ),
          ],
        ),
      ),
    );
  }
}