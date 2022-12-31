import 'package:flutter/material.dart';
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
              briefChat: 'Lorem ipsum dolor sit amet',
              date: '12/3/22',
            ),
            postedItemDetail(
              user: 'Ava',
              briefChat: 'Lorem ipsum dolor sit amet',
              date: '03/2/22',
            ),
            postedItemDetail(
              user: 'Arman',
              briefChat: 'Lorem ipsum dolor sit amet',
              date: '23/8/22',
            ),
            postedItemDetail(
              user: 'Alireza',
              briefChat: 'Lorem ipsum dolor sit amet',
              date: '18/6/22',
            ),
            postedItemDetail(
              user: 'Amir Mahdi',
              briefChat: 'Lorem ipsum dolor sit amet',
              date: '09/11/22',
            ),
            postedItemDetail(
              user: 'Sorena',
              briefChat: 'Lorem ipsum dolor sit amet',
              date: '08/6/22',
            ),
            postedItemDetail(
              user: 'Aria',
              briefChat: 'Lorem ipsum dolor sit amet',
              date: '29/6/22',
            ),
            postedItemDetail(
              user: 'Sobhan',
              briefChat: 'Lorem ipsum dolor sit amet',
              date: '25/6/22',
            ),
            postedItemDetail(
              user: 'Danial',
              briefChat: 'Lorem ipsum dolor sit amet',
              date: '22/3/22',
            ),
          ],
        ),
      ),
    );
  }
}
