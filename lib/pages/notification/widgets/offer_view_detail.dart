import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class OfferViewDetail extends StatefulWidget {
  final String user, imageUrl, briefChat, date;
  var data;

  OfferViewDetail({
    super.key,
    this.data,
    required this.user,
    required this.imageUrl,
    required this.briefChat,
    required this.date,
  });

  @override
  State<OfferViewDetail> createState() => _OfferViewDetailState();
}

class _OfferViewDetailState extends State<OfferViewDetail> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    Future<void> generateNotification(var desc) async {
      try {
        await FirebaseFirestore.instance
            .collection('order')
            .doc(widget.data['senderId'])
            .collection('notification')
            .doc()
            .set({
          'itemId': widget.data['itemId'],
          'itemTitle': widget.user,
          'itemImage': widget.imageUrl,
          'senderId': FirebaseAuth.instance.currentUser!.uid,
          'description': desc,
          'date': DateTime.now().toString(),
        });
        Fluttertoast.showToast(
            msg: "Successfully Done",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      } catch (e) {
        Fluttertoast.showToast(
            msg: "" + e.toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }

    return (widget.user != null)
        ? Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 2.0, right: 1.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black),
                borderRadius: BorderRadius.circular(20),
              ),
              // width: width,
              height: 100.0,
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
                        child: Container(
                          // width: 40.0,
                          height: 40.0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child:
                                // Image.asset(
                                //   imageUrl,
                                //   width: 45.0,
                                //   height: 50.0,
                                //   fit: BoxFit.cover,
                                // ),
                                Container(
                                    margin: EdgeInsets.all(4.0),
                                    width: 50.0,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      // borderRadius: BorderRadius.circular(8.0),
                                      image: DecorationImage(
                                        image: NetworkImage(widget.imageUrl),
                                        fit: BoxFit.cover,
                                      ),
                                    )),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 3.0, right: 2.0),
                        child: Row(
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: Text(
                                    widget.user,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(right: 0.0),
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          widget.date,
                                          style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            fontWeight: FontWeight.normal,
                                            fontSize: 12.0,
                                          ),
                                        ),
                                        // SizedBox(
                                        //   width: 5.0,
                                        // ),
                                        // Text(
                                        //   "Till: " + date,
                                        //   style: TextStyle(
                                        //     color: Colors.black.withOpacity(0.5),
                                        //     fontWeight: FontWeight.normal,
                                        //     fontSize: 12.0,
                                        //   ),
                                        // ),
                                      ],
                                    )),
                                Text(
                                  widget.briefChat,
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
                      ClipOval(
                        child: Material(
                          child: IconButton(
                            icon: const Icon(Icons.check, color: Colors.green),
                            onPressed: () {
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Comfirmation!'),
                                  content: const Text(
                                      'Do you really want to Accept Offer'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'Cancel'),
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () async {
                                        Navigator.pop(context, 'OK');
                                        generateNotification(
                                            "your Offer has been Accepted");
                                        try {
                                          await FirebaseFirestore.instance
                                              .collection('/Items')
                                              .doc('${widget.data['itemId']}')
                                              .update({
                                            'status': widget.data['senderId'],
                                          });
                                        } catch (e) {
                                          Fluttertoast.showToast(
                                              msg:
                                                  "update error" + e.toString(),
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.CENTER,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: Colors.red,
                                              textColor: Colors.white,
                                              fontSize: 16.0);
                                        }
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      ClipOval(
                        child: Material(
                          child: IconButton(
                            icon: const Icon(Icons.cancel_outlined,
                                color: Colors.red),
                            onPressed: () {
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Comfirmation!'),
                                  content: const Text(
                                      'Do you really want to Decline Offer'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context, 'Cancel');
                                      },
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context, 'OK');
                                        generateNotification(
                                            "your Offer has been Declined");
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        : Container();
  }
}
