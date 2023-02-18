import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:mad_project/widgets/posted_item_detail.dart';

import '../pages/Registorpage.dart';
import '../pages/upload.dart';

class PostedItems extends StatefulWidget {
  const PostedItems({super.key});

  @override
  State<PostedItems> createState() => _PostedItemsState();
}

class _PostedItemsState extends State<PostedItems> {
  // MyItem myItems = MyItem(
  //     id: "",
  //     title: "Temp2",
  //     description: "",
  //     category_id: " ",
  //     user_id: "",
  //     price: 0,
  //     guarantee_price: 0,
  //     images: [],
  //     quantity: 0,
  //     status: '0',
  //     date: DateTime.now());
  // MyUser currentUser = MyUser(
  //     uname: "User Name",
  //     email: "abc@xyz",
  //     contact_no: "",
  //     address: " ",
  //     city: " ",
  //     cnic: "",
  //     isLogin: true,
  //     isVerified: true,
  //     rating: 0);

  // Future<void> myCurrentUser() async {
  //   final docUser = await FirebaseFirestore.instance
  //       .collection('/users')
  //       .doc(FirebaseAuth.instance.currentUser!.uid);
  //   final doc = await docUser.get();
  //   if (doc.exists) {
  //     currentUser = MyUser.fromMap(doc.data() as Map<String, dynamic>);
  //   } else {
  //     currentUser = MyUser(
  //         uname: "User name",
  //         email: "Email",
  //         contact_no: "",
  //         address: "MyAddress",
  //         city: "city",
  //         cnic: "",
  //         isLogin: true,
  //         isVerified: true,
  //         rating: 0);
  //   }
  //   setState(() {});
  // }

  // Future<Stream<List<MyItem>>> myItem() async {
  //   // final docItm = await FirebaseFirestore.instance.collection('/Items').doc('2');
  //   final docItm = await FirebaseFirestore.instance
  //       .collection('/Items')
  //       .snapshots()
  //       .map((snapshot) => snapshot.docs
  //           .map((doc) => MyItem.fromMap(doc.data() as Map<String, dynamic>))
  //           .toList());

  //   setState(() {});
  //   return docItm;
  // }

  void initState() {
    super.initState();
    // myCurrentUser();
    // myItem();
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    // print("============================================================"+myItems.images[0]
    // );
    // final file = File(myItems.images[0]);
    // itm.asMap().map((index, url) =>
    //   Reference ref = FirebaseStorage.instance.refFromURL(url);
    // );
    // myItems.images.asMap().map((index, url) =>
    //   // Reference ref = FirebaseStorage.instance.refFromURL(url);
    //   url.getData(100000000).then((value) => {
    //     print("============================================================"+value.toString())
    //   })
    // );
    // Image image = Image.network(myItems.images[0]);

    return Container(
      width: width,
      height: double.infinity,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: FirebaseFirestore.instance.collection('/Items').snapshots(),
          builder: (_, snapshot) {
            if (snapshot.hasError) return Text('Error = ${snapshot.error}');

            if (snapshot.hasData) {
              final docs = snapshot.data!.docs;
              return ListView.builder(
                itemCount: docs.length,
                itemBuilder: (_, i) {
                  final data = docs[i].data();
                  return (FirebaseAuth.instance.currentUser != null)
                      ? ((FirebaseAuth.instance.currentUser!.uid ==
                              data['user_id'])
                          ? postedItemDetail(
                              item: data,
                            )
                          : Container())
                      : Container();
                },
              );
            }
            if (!snapshot.hasData) return Center(child: Text(''));

            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
