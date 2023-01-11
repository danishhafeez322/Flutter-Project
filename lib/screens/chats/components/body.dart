
import 'package:flutter/material.dart';

import '../../../models/Chat.dart';
import '../../messages/messages_screen.dart';
import 'chat_card.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: chatsData.length,
            itemBuilder: (context, index) => ChatCard(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MessagesScreen(),
                    ),
                  );
                },
                chat: chatsData[index],
              ),                
            ),
        );
    //   ],
    // );
  }
}
