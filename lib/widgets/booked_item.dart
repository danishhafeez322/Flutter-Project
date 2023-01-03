import 'package:flutter/material.dart';

import 'booked_item_detail.dart';
// import 'package:mad_project/colors/colors.dart';
// import 'package:mad_project/widgets/whatsapp_contact.dart';

class BookedItem extends StatelessWidget {
  const BookedItem({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(
      width: width,
      height: double.infinity,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 8,right: 8),
        child: ListView(
          primary: false,
          children: const <Widget>[
            BookedItemDetail(
              user: 'Shervin',
              imageUrl: "assets/images/bats.jpg",
              briefChat: 'Lorem ipsum dolor sit amet',
              date: '12/3/22',
            ),
            BookedItemDetail(
              user: 'Ava',
              imageUrl: "assets/images/bag.jpg",
              briefChat: 'Lorem ipsum dolor sit amet',
              date: '03/2/22',
            ),
            BookedItemDetail(
              user: 'Arman',
              imageUrl: "assets/images/auto.jpg",
              briefChat: 'Lorem ipsum dolor sit amet',
              date: '23/8/22',
            ),
            BookedItemDetail(
              user: 'Alireza',
              imageUrl: "assets/images/bats.jpg",
              briefChat: 'Lorem ipsum dolor sit amet',
              date: '18/6/22',
            ),
            BookedItemDetail(
              user: 'Amir Mahdi',
              imageUrl: "assets/images/bats.jpg",
              briefChat: 'Lorem ipsum dolor sit amet',
              date: '09/11/22',
            ),
            BookedItemDetail(
              user: 'Sorena',
              imageUrl: "assets/images/bats.jpg",
              briefChat: 'Lorem ipsum dolor sit amet',
              date: '08/6/22',
            ),
            BookedItemDetail(
              user: 'Aria',
              imageUrl: "assets/images/bats.jpg",
              briefChat: 'Lorem ipsum dolor sit amet',
              date: '29/6/22',
            ),
            BookedItemDetail(
              user: 'Sobhan',
              imageUrl: "assets/images/bats.jpg",
              briefChat: 'Lorem ipsum dolor sit amet',
              date: '25/6/22',
            ),
            BookedItemDetail(
              user: 'Danial',
              imageUrl: "assets/images/bats.jpg",
              briefChat: 'Lorem ipsum dolor sit amet',
              date: '22/3/22',
            ),
            SizedBox(height: 70),
          ],
        ),
      ),
    );
  }
}
