import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:mad_project/widgets/posted_item_detail.dart';

class PostedItems extends StatelessWidget {
  const PostedItems({super.key});

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
            postedItemDetail(
              user: 'Shervin',               
              imageUrl: "assets/images/bag.jpg",
              briefChat: 'Lorem ipsum dolor sit amet',
              date: '12/3/22',
            ),
            postedItemDetail(
              user: 'Ava',
              imageUrl: "assets/images/badminton.jpg",
              briefChat: 'Lorem ipsum dolor sit amet',
              date: '03/2/22',
            ),
            postedItemDetail(
              user: 'Arman',
              imageUrl: "assets/images/bats.jpg",
              briefChat: 'Lorem ipsum dolor sit amet',
              date: '23/8/22',
            ),
            postedItemDetail(
              user: 'Alireza',
              imageUrl: "assets/images/cultus.jpg",
              briefChat: 'Lorem ipsum dolor sit amet',
              date: '18/6/22',
            ),
            postedItemDetail(
              user: 'Amir Mahdi',
              imageUrl: "assets/images/bats.jpg",
              briefChat: 'Lorem ipsum dolor sit amet',
              date: '09/11/22',
            ),
            postedItemDetail(
              user: 'Sorena',
              imageUrl: "assets/images/bats.jpg",
              briefChat: 'Lorem ipsum dolor sit amet',
              date: '08/6/22',
            ),
            postedItemDetail(
              user: 'Aria',
              imageUrl: "assets/images/freezer.jpg",
              briefChat: 'Lorem ipsum dolor sit amet',
              date: '29/6/22',
            ),
            postedItemDetail(
              user: 'Sobhan',
              imageUrl: "assets/images/bag.jpg",
              briefChat: 'Lorem ipsum dolor sit amet',
              date: '25/6/22',
            ),
            postedItemDetail(
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
