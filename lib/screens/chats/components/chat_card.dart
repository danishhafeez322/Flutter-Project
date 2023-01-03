import 'package:flutter/material.dart';

import '../../../core/constant/constants.dart';
import '../../../models/Chat.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({Key? key, required this.chat, required this.press})
      : super(key: key);
  final Chat chat;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding, vertical: kDefaultPadding * 0.75),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          chat.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Opacity(
                          opacity: 0.64,
                          child: Text(
                            chat.lastMessage,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Opacity(
                  opacity: 0.64,
                  child: Text(chat.time),
                ),
              ],
            ),
          ),
          Divider(
                    height: 1,
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                  )
        ],
      ),
    );
  }
}
