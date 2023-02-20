import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'offer_view_detail.dart';

class OfferView extends StatefulWidget {
  const OfferView({super.key});

  @override
  State<OfferView> createState() => _OfferViewState();
}

class _OfferViewState extends State<OfferView> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return (FirebaseAuth.instance.currentUser != null)
        ? Container(
            width: width,
            height: double.infinity,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: FirebaseFirestore.instance
                    .collection('/order')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .collection('offer')
                    .snapshots(),
                builder: (_, snapshot) {
                  if (snapshot.hasError)
                    return Text('Error = ${snapshot.error}');

                  if (snapshot.hasData) {
                    final docs = snapshot.data!.docs;
                    return ListView.builder(
                      itemCount: docs.length,
                      itemBuilder: (_, i) {
                        final data = docs[i].data();
                        return (FirebaseAuth.instance.currentUser != null)
                            ?
                            // ((FirebaseAuth.instance.currentUser!.uid != data['senderName'])?
                            OfferViewDetail(
                                user: data['itemTitle'].toString(),
                                imageUrl: data['itemImage'][0],
                                date:
                                    'rent: ${data['price']} - gaurantee ${data['gaurantee_price']}',
                                briefChat:
                                    'from: ${data['startDate']} till: ${data['endDate']}',
                                data: data,
                              )
                            // Text('${data} \n');

                            // : null)
                            : Container();
                      },
                    );
                  } else {
                    Container(
                      child: Text('No Offer'),
                    );
                  }
                  // setState(() {

                  // });

                  return Center(child: CircularProgressIndicator());
                },
              ),

              // ListView(
              //   primary: false,
              //   children:
              //   const <Widget>[
              //     OfferViewDetail(
              //       user: 'Shervin',
              //       imageUrl: "assets/images/bag.jpg",
              //       briefChat: 'Lorem ipsum dolor sit amet',
              //       date: '12/3/22',
              //     ),
              //     OfferViewDetail(
              //       user: 'Ava',
              //       imageUrl: "assets/images/badminton.jpg",
              //       briefChat: 'Lorem ipsum dolor sit amet',
              //       date: '03/2/22',
              //     ),
              //     OfferViewDetail(
              //       user: 'Arman',
              //       imageUrl: "assets/images/bats.jpg",
              //       briefChat: 'Lorem ipsum dolor sit amet',
              //       date: '23/8/22',
              //     ),
              //     OfferViewDetail(
              //       user: 'Alireza',
              //       imageUrl: "assets/images/cultus.jpg",
              //       briefChat: 'Lorem ipsum dolor sit amet',
              //       date: '18/6/22',
              //     ),
              //     OfferViewDetail(
              //       user: 'Amir Mahdi',
              //       imageUrl: "assets/images/bats.jpg",
              //       briefChat: 'Lorem ipsum dolor sit amet',
              //       date: '09/11/22',
              //     ),
              //     OfferViewDetail(
              //       user: 'Sorena',
              //       imageUrl: "assets/images/bats.jpg",
              //       briefChat: 'Lorem ipsum dolor sit amet',
              //       date: '08/6/22',
              //     ),
              //     OfferViewDetail(
              //       user: 'Aria',
              //       imageUrl: "assets/images/freezer.jpg",
              //       briefChat: 'Lorem ipsum dolor sit amet',
              //       date: '29/6/22',
              //     ),
              //     OfferViewDetail(
              //       user: 'Sobhan',
              //       imageUrl: "assets/images/bag.jpg",
              //       briefChat: 'Lorem ipsum dolor sit amet',
              //       date: '25/6/22',
              //     ),
              //     OfferViewDetail(
              //       user: 'Danial',
              //       imageUrl: "assets/images/auto.jpg",
              //       briefChat: 'Lorem ipsum dolor sit amet',
              //       date: '22/3/22',
              //     ),
              //     SizedBox(height: 70),

              //   ],
              // ),
            ),
          )
        : Container(child: Text('Login First'));
  }
}
