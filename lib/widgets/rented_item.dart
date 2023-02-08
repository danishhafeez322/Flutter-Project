import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mad_project/widgets/rented_item_detail.dart';

class RentedItem extends StatelessWidget {
  const RentedItem({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(
      width: width,
      height: double.infinity,
      color: Colors.white,
      child: Padding(
          padding:
              const EdgeInsets.only(left: 8, right: 8, top: 10, bottom: 10),
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
                    return RentedItemDetail(
                      item: data,
                    );
                  },
                );
              }

              return Center(child: CircularProgressIndicator());
            },
          )),
    );
  }
}
