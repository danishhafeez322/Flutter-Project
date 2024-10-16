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
  }
}
