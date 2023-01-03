import 'package:flutter/material.dart';

import 'offer_view_detail.dart';

class OfferView extends StatelessWidget {
  const OfferView({super.key});

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
            OfferViewDetail(
              user: 'Shervin',               
              imageUrl: "assets/images/bag.jpg",
              briefChat: 'Lorem ipsum dolor sit amet',
              date: '12/3/22',
            ),
            OfferViewDetail(
              user: 'Ava',
              imageUrl: "assets/images/badminton.jpg",
              briefChat: 'Lorem ipsum dolor sit amet',
              date: '03/2/22',
            ),
            OfferViewDetail(
              user: 'Arman',
              imageUrl: "assets/images/bats.jpg",
              briefChat: 'Lorem ipsum dolor sit amet',
              date: '23/8/22',
            ),
            OfferViewDetail(
              user: 'Alireza',
              imageUrl: "assets/images/cultus.jpg",
              briefChat: 'Lorem ipsum dolor sit amet',
              date: '18/6/22',
            ),
            OfferViewDetail(
              user: 'Amir Mahdi',
              imageUrl: "assets/images/bats.jpg",
              briefChat: 'Lorem ipsum dolor sit amet',
              date: '09/11/22',
            ),
            OfferViewDetail(
              user: 'Sorena',
              imageUrl: "assets/images/bats.jpg",
              briefChat: 'Lorem ipsum dolor sit amet',
              date: '08/6/22',
            ),
            OfferViewDetail(
              user: 'Aria',
              imageUrl: "assets/images/freezer.jpg",
              briefChat: 'Lorem ipsum dolor sit amet',
              date: '29/6/22',
            ),
            OfferViewDetail(
              user: 'Sobhan',
              imageUrl: "assets/images/bag.jpg",
              briefChat: 'Lorem ipsum dolor sit amet',
              date: '25/6/22',
            ),
            OfferViewDetail(
              user: 'Danial',
              imageUrl: "assets/images/auto.jpg",
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
