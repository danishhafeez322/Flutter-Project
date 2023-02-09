// import 'package:flutter/material.dart';

// import '../../../core/constant/constants.dart';
// import '../../../models/Chat.dart';

// class ChatCard extends StatelessWidget {
//   const ChatCard({Key? key, required this.chat, required this.press})
//       : super(key: key);
//   final Chat chat;
//   final VoidCallback press;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: press,
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(
//                 horizontal: kDefaultPadding, vertical: kDefaultPadding * 0.75),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: Padding(
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: kDefaultPadding),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           chat.name,
//                           style: const TextStyle(
//                             fontWeight: FontWeight.w500,
//                             fontSize: 16,
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 8,
//                         ),
//                         Opacity(
//                           opacity: 0.64,
//                           child: Text(
//                             chat.lastMessage,
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Opacity(
//                   opacity: 0.64,
//                   child: Text(chat.time),
//                 ),
//               ],
//             ),
//           ),
//           Divider(
//             height: 1,
//             thickness: 1,
//             indent: 20,
//             endIndent: 20,
//           )
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class ChatCard extends StatelessWidget {
  final Map<String, dynamic> item;

  const ChatCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    // var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
      child: Container(
        // decoration: BoxDecoration(
        //   border: Border.all(width: 1, color: Colors.black87),
        //   borderRadius: BorderRadius.circular(20),
        // ),
        //width: 160,
        height: 75.0,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () async {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(0.0),
                    child: Container(
                      margin: EdgeInsets.all(6.0),
                      width: 58.0,
                      height: 58.0,
                      decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: NetworkImage("" + item['images'][0]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 10.0, left: 5),
                              child: Text(
                                item['title'],
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(
                                item['description'],
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.6),
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
