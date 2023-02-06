import 'package:flutter/material.dart';

import 'given_item_detail.dart';

class GivenItem extends StatelessWidget {
  const GivenItem({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(
      width: width,
      height: double.infinity,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: ListView(
          primary: false,
          children: const <Widget>[
            GivenItemDetail(
              user: 'Shervin',
              imageUrl: "assets/images/auto.jpg",
              briefChat: 'Lorem ipsum dolor sit amet',
              date: '12/3/22',
            ),
            GivenItemDetail(
              user: 'Ava',
              imageUrl: "assets/images/auto.jpg",
              briefChat: 'Lorem ipsum dolor sit amet',
              date: '03/2/22',
            ),
            GivenItemDetail(
              user: 'Arman',
              imageUrl: "assets/images/bats.jpg",
              briefChat: 'Lorem ipsum dolor sit amet',
              date: '23/8/22',
            ),
            GivenItemDetail(
              user: 'Alireza',
              imageUrl: "assets/images/bag.jpg",
              briefChat: 'Lorem ipsum dolor sit amet',
              date: '18/6/22',
            ),
            GivenItemDetail(
              user: 'Amir Mahdi',
              imageUrl: "assets/images/bag.jpg",
              briefChat: 'Lorem ipsum dolor sit amet',
              date: '09/11/22',
            ),
            GivenItemDetail(
              user: 'Sorena',
              imageUrl: "assets/images/auto.jpg",
              briefChat: 'Lorem ipsum dolor sit amet',
              date: '08/6/22',
            ),
            GivenItemDetail(
              user: 'Aria',
              imageUrl: "assets/images/auto.jpg",
              briefChat: 'Lorem ipsum dolor sit amet',
              date: '29/6/22',
            ),
            GivenItemDetail(
              user: 'Sobhan',
              imageUrl: "assets/images/auto.jpg",
              briefChat: 'Lorem ipsum dolor sit amet',
              date: '25/6/22',
            ),
            GivenItemDetail(
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
