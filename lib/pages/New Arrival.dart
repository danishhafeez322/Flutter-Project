import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mad_project/pages/login_view.dart';

import 'package:mad_project/pages/upload.dart';

import '../models/category.dart';
import 'detailspage.dart';

class NewArrival extends StatefulWidget {
  // var selectedCategory;
  NewArrival({Key? key}) : super(key: key);

  @override
  State<NewArrival> createState() => _NewArrivalState();
}

class _NewArrivalState extends State<NewArrival> {
  var temp;
  Future<void> myItems() async {
    var mytemp = await FirebaseFirestore.instance.collection('/Items').get();
    List<Map<String, dynamic>> temp1 =
        mytemp.docs.map((doc) => doc.data()).toList();
    temp = temp1;

    setState(() {});
  }

  @override
  void initState() {
    myItems();
    super.initState();
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 20),
      child: (temp != null)
          ? Container(
              // child: Expanded(
              child: GridView.count(
                crossAxisCount: (kIsWeb) ? (4) : (2),
                shrinkWrap: true,
                padding: EdgeInsets.only(bottom: 2, top: 10),
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(
                  temp.length,
                  (index) => Container(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  (FirebaseAuth.instance.currentUser != null)
                                      ? (DetailsPage(
                                          myItem_id: temp[index]['id'],
                                        ))
                                      : LoginView()),
                        );
                      },
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                color: Colors.black54,
                                width: 1,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black45,
                                  offset: const Offset(
                                    2.0,
                                    2.0,
                                  ), //Offset
                                  blurRadius: 4.0,
                                  spreadRadius: 1.0,
                                )
                              ],
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15),
                              ),
                              child: Container(
                                width: 125,
                                height: 125,
                                // margin: EdgeInsets.all(6.0),
                                decoration: BoxDecoration(
                                  // borderRadius: BorderRadius.circular(8.0),
                                  image: DecorationImage(
                                    image:
                                        NetworkImage(temp[index]['images'][0]),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              temp[index]['title'],
                              style: const TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ).reversed.toList(),
              ),
              // ),
            )
          : Container(),
      // )
    );
    // );
  }
}
