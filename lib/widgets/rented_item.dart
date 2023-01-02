import 'package:flutter/material.dart';
import 'package:mad_project/widgets/rented_item_detail.dart';
// import 'package:mad_project/colors/colors.dart';
// import 'package:mad_project/widgets/whatsapp_contact.dart';

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
        padding: const EdgeInsets.only(left: 8,right: 8),
        child: ListView(
          primary: false,
          children: const <Widget>[
            RentedItemDetail(
              user: 'Shervin',
              imageUrl: "assets/images/bats.jpg",
              briefChat: 'Lorem ipsum dolor sit amet',
              date: '12/3/22',
            ),
            RentedItemDetail(
              user: 'Ava',
              imageUrl: "assets/images/bag.jpg",
              briefChat: 'Lorem ipsum dolor sit amet',
              date: '03/2/22',
            ),
            RentedItemDetail(
              user: 'Arman',
              imageUrl: "assets/images/auto.jpg",
              briefChat: 'Lorem ipsum dolor sit amet',
              date: '23/8/22',
            ),
            RentedItemDetail(
              user: 'Alireza',
              imageUrl: "assets/images/bats.jpg",
              briefChat: 'Lorem ipsum dolor sit amet',
              date: '18/6/22',
            ),
            RentedItemDetail(
              user: 'Amir Mahdi',
              imageUrl: "assets/images/bats.jpg",
              briefChat: 'Lorem ipsum dolor sit amet',
              date: '09/11/22',
            ),
            RentedItemDetail(
              user: 'Sorena',
              imageUrl: "assets/images/bats.jpg",
              briefChat: 'Lorem ipsum dolor sit amet',
              date: '08/6/22',
            ),
            RentedItemDetail(
              user: 'Aria',
              imageUrl: "assets/images/bats.jpg",
              briefChat: 'Lorem ipsum dolor sit amet',
              date: '29/6/22',
            ),
            RentedItemDetail(
              user: 'Sobhan',
              imageUrl: "assets/images/bats.jpg",
              briefChat: 'Lorem ipsum dolor sit amet',
              date: '25/6/22',
            ),
            RentedItemDetail(
              user: 'Danial',
              imageUrl: "assets/images/bats.jpg",
              briefChat: 'Lorem ipsum dolor sit amet',
              date: '22/3/22',
            ),
          ],
        ),
      ),
    );
  }
}
