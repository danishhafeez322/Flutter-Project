import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'detailspage.dart';
import 'login_view.dart';

class NewArrival extends StatefulWidget {
  // var selectedCategory;
  NewArrival({Key? key}) : super(key: key);

  @override
  State<NewArrival> createState() => _NewArrivalState();
}

class _NewArrivalState extends State<NewArrival> {
  Future<List<Map<String, dynamic>>> newArrivals() async {
    final Items = await FirebaseFirestore.instance.collection('/Items').get();
    final itemList = Items.docs.map((doc) => doc.data()).toList();
    return itemList;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: newArrivals(),
      builder: (BuildContext context,
          AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
        final newItem = snapshot.data;
        if (!snapshot.hasData) return Center(child: Text('No New Arrival'));
        // if (!snapshot.hasError)
        //   return Center(child: Text(snapshot.error.toString()));
        if (snapshot.hasData)
          return Container(
            child: GridView.builder(
              padding: const EdgeInsets.all(15),
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: newItem?.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: (kIsWeb) ? (4) : (2),
                crossAxisSpacing: 8,
                mainAxisSpacing: 15,
                // childAspectRatio: 1.15,
              ),
              itemBuilder: (_, index) => Container(
                child: GestureDetector(
                  onTap: () {
                    onTapNewArrivalCard(context, newItem?[index]['id']);
                  },
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                        child: Container(
                          width: 125,
                          height: 125,
                          // margin: EdgeInsets.all(6.0),
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
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: newItem?[index]['images'][0],
                            fit: BoxFit.cover,
                            errorWidget: (_, __, err) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          newItem?[index]['title'],
                          style: const TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        return CircularProgressIndicator();
      },
    );
  }

  void onTapNewArrivalCard(BuildContext context, dynamic item) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => (FirebaseAuth.instance.currentUser != null)
              ? (DetailsPage(
                  myItem_id: item,
                ))
              : LoginView()),
    );
  }
}
