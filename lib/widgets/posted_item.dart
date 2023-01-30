
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
    MyItem myItems = MyItem(id: "", title: "Temp2", description: "", category_id: " ", user_id: "", price: 0, guarantee_price: 0, images: [], quantity: 0, status: 0,date: DateTime.now());
    MyUser currentUser = MyUser(uname: "User Name", email: "abc@xyz", contact_no: "", address: " ", city: " ", cnic: "", isLogin: true,isVerified: true,rating: 0);
  

    Future<void> myCurrentUser() async{  
      
      final docUser = await FirebaseFirestore.instance.collection('/users').doc(FirebaseAuth.instance.currentUser!.uid);
      final doc = await docUser.get();
      if(doc.exists)
      {        
        currentUser = MyUser.fromMap(doc.data() as Map<String, dynamic>);
      }
      else
      {
       currentUser = MyUser(uname: "User name", email: "Email", contact_no: "", address: "MyAddress", city: "city", cnic: "", isLogin: true,isVerified: true,rating: 0);
      }
      setState(() {
         
       }); 
    }
    
    Future<Stream<List<MyItem>>> myItem() async{  
      
      
      // final docItm = await FirebaseFirestore.instance.collection('/Items').doc('2');
      final docItm = await FirebaseFirestore.instance.collection('/Items')
      .snapshots()
      .map((snapshot) => snapshot.docs.map((doc) => MyItem.fromMap(doc.data() as Map<String, dynamic>)).toList());
      // final doc = await docItm.get();
      // if(doc.exists)
      // {                
      //   myItems = MyItem.fromMap(doc.data() as Map<String, dynamic>);
      // }
      // else
      // { 
      //   myItems = MyItem(id: "", title: "Temp", description: "", category_id: " ", user_id: "", price: 0, guarantee_price: 0, images: [], quantity: 0, status: 0,date: DateTime.now());        
      // }
      
      setState(() {         
       }); 
       return docItm;
    }
    void initState()  {
      super.initState();
       myCurrentUser();
       myItem();
      setState(() {
        
      });
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
        padding: const EdgeInsets.only(left: 8,right: 8),
        child:
            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: FirebaseFirestore.instance.collection('/Items').snapshots(),
            builder: (_, snapshot) {
              if (snapshot.hasError) return Text('Error = ${snapshot.error}');

              if (snapshot.hasData) {
                final docs = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: docs.length,
                  itemBuilder: (_, i) {
                    final data = docs[i].data();
                    return (FirebaseAuth.instance.currentUser!.uid == data['user_id'])? postedItemDetail( item:data, ) : Container();
                  },
                );
              }
              setState(() {
                
              });

              return Center(child: CircularProgressIndicator());
            },
            ),
        
        // ListView(
        //   primary: false,
        //   children:  <Widget>[
        //     postedItemDetail(
        //       user: (myItems.title.toString() != "") ? myItems.title.toString() : "temp",               
        //       imageUrl: myItems.images[0],
        //       briefChat: myItems.description.toString(),
        //       date: myItems.date.toString(),
        //     ),
        //     postedItemDetail(
        //       user: currentUser.uname.toString(),
        //       imageUrl: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fpixabay.com%2Fimages%2Fsearch%2Fnature%2F&psig=AOvVaw0Ub-iuL66_jt9sHTqjck7_&ust=1674817398763000&source=images&cd=vfe&ved=0CA8QjRxqFwoTCJj-15KL5fwCFQAAAAAdAAAAABAE",
        //       briefChat: 'Lorem ipsum dolor sit amet',
        //       date: '03/2/22',
        //     ),
        //     postedItemDetail(
        //       user: 'Arman',
        //       imageUrl: "assets/images/bats.jpg",
        //       briefChat: 'Lorem ipsum dolor sit amet',
        //       date: '23/8/22',
        //     ),
        //     postedItemDetail(
        //       user: 'Alireza',
        //       imageUrl: "assets/images/cultus.jpg",
        //       briefChat: 'Lorem ipsum dolor sit amet',
        //       date: '18/6/22',
        //     ),
        //     postedItemDetail(
        //       user: 'Amir Mahdi',
        //       imageUrl: "assets/images/bats.jpg",
        //       briefChat: 'Lorem ipsum dolor sit amet',
        //       date: '09/11/22',
        //     ),
        //     postedItemDetail(
        //       user: 'Sorena',
        //       imageUrl: "assets/images/bats.jpg",
        //       briefChat: 'Lorem ipsum dolor sit amet',
        //       date: '08/6/22',
        //     ),
        //     postedItemDetail(
        //       user: 'Aria',
        //       imageUrl: "assets/images/freezer.jpg",
        //       briefChat: 'Lorem ipsum dolor sit amet',
        //       date: '29/6/22',
        //     ),
        //     postedItemDetail(
        //       user: 'Sobhan',
        //       imageUrl: "assets/images/bag.jpg",
        //       briefChat: 'Lorem ipsum dolor sit amet',
        //       date: '25/6/22',
        //     ),
        //     postedItemDetail(
        //       user: 'Danial',
        //       imageUrl: "assets/images/auto.jpg",
        //       briefChat: 'Lorem ipsum dolor sit amet',
        //       date: '22/3/22',
        //     ),
        //     SizedBox(height: 70),
        //    ],
        // ),
       ),
    );
  }
}