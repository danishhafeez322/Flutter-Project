import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mad_project/widgets/rented_item_detail.dart';

import 'noticifation_view_detail.dart';
// import 'package:mad_project/colors/colors.dart';
// import 'package:mad_project/widgets/whatsapp_contact.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return (FirebaseAuth.instance.currentUser != null)? Container(
      width: width,
      height: double.infinity,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 8,right: 8),
        child: 
        StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: FirebaseFirestore.instance.collection('/order').doc(FirebaseAuth.instance.currentUser!.uid).collection('notification').snapshots(),
            builder: (_, snapshot) {
              if (snapshot.hasError) return Text('Error = ${snapshot.error}');

              if (snapshot.hasData) {
                final docs = snapshot.data!.docs;
                return 
                ListView.builder(
                  itemCount: docs.length,
                  itemBuilder: (_, i) {
                    final data = docs[i].data();
                    // final temp = DateTime.now().difference( data['date'].toDate()).inDays;
                    return 
                            // (FirebaseAuth.instance.currentUser != null)? 
                            //   ((FirebaseAuth.instance.currentUser!.uid == data['senderName'])? 
                                  NotificationViewDetail( 
                                    itemId:  data['itemId'],                                   
                                    user: data['itemTitle'].toString(),
                                    briefChat: data['description'] ,
                                    date: DateTime.now()
                                      .difference(DateTime.parse(data['date']))
                                      .inDays
                                      .toString() +
                                  " days ago",
                                    
                                   ); 
                                  // Text('${data} \n');
                              
                              //     : Container())
                              // : Container();
                  },
                );
              }
              else{
                Container(child: Text('No Notifications'),);
              }
              setState(() {
                
              });

              return Center(child: CircularProgressIndicator());
            },
        ),
        
        
        // ListView(
        //   primary: false,
        //   children: const <Widget>[
        //     NotificationViewDetail(
        //       user: 'Shervin',
        //       briefChat: 'Lorem ipsum dolor sit amet',
        //       date: '12/3/22',
        //     ),
        //     NotificationViewDetail(
        //       user: 'Ava',
        //       briefChat: 'Lorem ipsum dolor sit amet',
        //       date: '03/2/22',
        //     ),
        //     NotificationViewDetail(
        //       user: 'Arman',
        //       briefChat: 'Lorem ipsum dolor sit amet',
        //       date: '23/8/22',
        //     ),
        //     NotificationViewDetail(
        //       user: 'Alireza',
        //       briefChat: 'Lorem ipsum dolor sit amet',
        //       date: '18/6/22',
        //     ),
        //     NotificationViewDetail(
        //       user: 'Amir Mahdi',
        //       briefChat: 'Lorem ipsum dolor sit amet',
        //       date: '09/11/22',
        //     ),
        //     NotificationViewDetail(
        //       user: 'Sorena',
        //       briefChat: 'Lorem ipsum dolor sit amet',
        //       date: '08/6/22',
        //     ),
        //     NotificationViewDetail(
        //       user: 'Aria',
        //       briefChat: 'Lorem ipsum dolor sit amet',
        //       date: '29/6/22',
        //     ),
        //     NotificationViewDetail(
        //       user: 'Sobhan',
        //       briefChat: 'Lorem ipsum dolor sit amet',
        //       date: '25/6/22',
        //     ),
        //     NotificationViewDetail(
        //       user: 'Danial',
        //       briefChat: 'Lorem ipsum dolor sit amet',
        //       date: '22/3/22',
        //     ),
        //     SizedBox(height: 70),
        //   ],
        // ),
      ),
    ):Container(child:Text("LogIn First..."));
  }
}
