import 'package:flutter/material.dart';
import 'package:mad_project/core/constant/app_color.dart';
import 'package:mad_project/pages/detailspage.dart';

class NotificationViewDetail extends StatelessWidget {
  final String user, briefChat, date, itemId;

  const NotificationViewDetail({
    super.key,
    required this.itemId,
    required this.user,
    required this.briefChat,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: AppColors.loginColor),
        // borderRadius: BorderRadius.circular(20),
      ),
        width: width,
        height: 45.0,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsPage(
                    myItem_id: itemId,
                  ),
                ),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // Padding(
                //   padding: const EdgeInsets.only(left: 10.0),
                //   child: ClipRRect(
                //     borderRadius: BorderRadius.circular(0.0),
                //     child: Image.asset(
                //       imageUrl,
                //       width: 58.0,
                //       height: 58.0,
                //       fit: BoxFit.cover,
                      
                //     ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Row(
                    children: <Widget>[
                      
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 2.0),
                            child: Text(
                              user,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                          Text(
                            briefChat,
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
                        date,
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
