import 'package:flutter/material.dart';
import 'package:mad_project/pages/detailspage.dart';
import 'package:mad_project/pages/upload.dart';

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
    var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.black),
          borderRadius: BorderRadius.circular(20),
        ),
        width: width,
        height: 75.0,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsPage(
                    myItem_id: widget.item['id'],
                  ),
                ),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(0.0),
                        child: Container(
                          margin: EdgeInsets.all(2.0),
                          width: 58.0,
                          height: 58.0,
                          decoration: BoxDecoration(
                            // borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image:
                                  NetworkImage("" + widget.item['images'][0]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 2.0, left: 5),
                      child: Row(
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: Text(
                                  widget.item['title'],
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                              Text(
                                widget.item['description'],
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.5),
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        DateTime.now()
                                .difference(DateTime.parse(widget.item['date']))
                                .inDays
                                .toString() +
                            " days ago",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.5), fontSize: 13),
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
