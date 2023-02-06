import 'package:flutter/material.dart';
import '../../core/constant/app_color.dart';
import '../../core/constant/constants.dart';
import '../../models/Chat.dart';
import 'components/body.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key, required this.chat}) : super(key: key);
  final Chat chat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(chat: chat),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.chatColor,
      title: Row(
        children: [
          const BackButton(),
          const CircleAvatar(
            backgroundImage: AssetImage(
              "assets/images/profile.png",
            ),
          ),
          const SizedBox(
            width: kDefaultPadding * 0.75,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Adham Atof",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ],
      ),
      // actions: [
      //   IconButton(
      //     onPressed: () {},
      //     icon: const Icon(
      //       Icons.local_offer,
      //     ),
      //   ),
      // ],
    );
  }
}
