import 'package:flutter/material.dart';
// import 'package:mad_project/colors/colors.dart';
// import 'package:mad_project/widgets/whatsapp_plus_button.dart';

class GivenItemDetail extends StatelessWidget {
  // final String user, imageUrl, briefChat, date;
  final Map<String, dynamic> item;



  const GivenItemDetail({
    super.key,
    // required this.user,
    // required this.imageUrl,
    // required this.briefChat,
    // required this.date,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
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
            onTap: () async {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(0.0),
                    child: 
                    // Image.asset(
                    //   imageUrl,
                    //   width: 58.0,
                    //   height: 58.0,
                    //   fit: BoxFit.cover,
                    // ),
                    Container(
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
                  padding: const EdgeInsets.only(right: 2.0),
                  child: Row(
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Text(
                              item['title'],
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                          Text(
                              (item['description'].length > 30)? (item['description'].toString().substring(0, 30) + '...'):(item['description'].toString()),
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontWeight: FontWeight.normal,
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Today',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
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
