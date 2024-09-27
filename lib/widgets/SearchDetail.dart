import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SearchDetails extends StatefulWidget {
  final Map<String, dynamic> item;
  const SearchDetails({
    super.key,
    required this.item,
  });

  @override
  State<SearchDetails> createState() => _RentedItemDetailState();
}

class _RentedItemDetailState extends State<SearchDetails> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ListTile(
      leading: CircleAvatar(
        radius: 30,
        child: Container(
          margin: EdgeInsets.all(2.0),
          width: 58.0,
          height: 58.0,
          decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: CachedNetworkImageProvider("" + widget.item['images'][0]),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      title: Text(
        widget.item['title'],
        style: const TextStyle(
          overflow: TextOverflow.ellipsis,
          color: Colors.black,
          fontWeight: FontWeight.normal,
          fontSize: 16.0,
        ),
      ),
      subtitle: Text(
        widget.item['description'],
        style: TextStyle(
          overflow: TextOverflow.ellipsis,
          color: Colors.black.withOpacity(0.5),
          fontWeight: FontWeight.normal,
          fontSize: 12.0,
        ),
      ),
      trailing: Text(
        DateTime.now()
                .difference(DateTime.parse(widget.item['date']))
                .inDays
                .toString() +
            " days ago",
        style: TextStyle(
            overflow: TextOverflow.ellipsis,
            color: Colors.black.withOpacity(0.5),
            fontSize: 11),
      ),
    );
    // return Padding(
    //   padding: const EdgeInsets.only(top: 8.0),
    //   child: Container(
    //     decoration: BoxDecoration(
    //       border: Border.all(width: 1, color: Colors.black45),
    //       borderRadius: BorderRadius.circular(20),
    //     ),
    //     width: width,
    //     height: 75.0,
    //     child: Material(
    //       color: Colors.transparent,
    //       child: InkWell(
    //         onTap: () {
    //           Navigator.push(
    //             context,
    //             MaterialPageRoute(
    //               builder: (context) =>
    //                   (FirebaseAuth.instance.currentUser != null)
    //                       ? DetailsPage(
    //                           myItem_id: widget.item['id'],
    //                         )
    //                       : LoginView(),
    //             ),
    //           );
    //         },
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           //crossAxisAlignment: CrossAxisAlignment.center,
    //           children: <Widget>[
    //             Row(
    //               children: [
    //                 Padding(
    //                   padding: const EdgeInsets.only(left: 5.0),
    //                   child: ClipRRect(
    //                     borderRadius: BorderRadius.circular(0.0),
    //                     child: Container(
    //                       margin: EdgeInsets.all(2.0),
    //                       width: 58.0,
    //                       height: 58.0,
    //                       decoration: BoxDecoration(
    //                         // borderRadius: BorderRadius.circular(8.0),
    //                         image: DecorationImage(
    //                           image: CachedNetworkImageProvider(
    //                               "" + widget.item['images'][0]),
    //                           fit: BoxFit.cover,
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //                 Padding(
    //                   padding: const EdgeInsets.only(right: 2.0, left: 5),
    //                   child: Row(
    //                     children: <Widget>[
    //                       Column(
    //                         mainAxisAlignment: MainAxisAlignment.center,
    //                         crossAxisAlignment: CrossAxisAlignment.start,
    //                         children: <Widget>[
    //                           Padding(
    //                             padding: const EdgeInsets.only(bottom: 10.0),
    //                             child: Text(
    //                               widget.item['title'],
    //                               style: const TextStyle(
    //                                 overflow: TextOverflow.ellipsis,
    //                                 color: Colors.black,
    //                                 fontWeight: FontWeight.normal,
    //                                 fontSize: 16.0,
    //                               ),
    //                             ),
    //                           ),
    //                           Text(
    //                             widget.item['description'],
    //                             style: TextStyle(
    //                               overflow: TextOverflow.ellipsis,
    //                               color: Colors.black.withOpacity(0.5),
    //                               fontWeight: FontWeight.normal,
    //                               fontSize: 12.0,
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ],
    //             ),
    //             Expanded(
    //               child: Padding(
    //                 padding: const EdgeInsets.only(right: 5.0),
    //                 child: Text(
    //                   DateTime.now()
    //                           .difference(DateTime.parse(widget.item['date']))
    //                           .inDays
    //                           .toString() +
    //                       " days ago",
    //                   style: TextStyle(
    //                       overflow: TextOverflow.ellipsis,
    //                       color: Colors.black.withOpacity(0.5),
    //                       fontSize: 11),
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
