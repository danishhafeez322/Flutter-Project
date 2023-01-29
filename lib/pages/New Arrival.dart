import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mad_project/pages/upload.dart';

import '../models/category.dart';
import 'detailspage.dart';

class NewArrival extends StatelessWidget {
  Category selectedCategory;
  NewArrival({Key? key, required this.selectedCategory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 20),
      child: Container(
        height: 650,
        child: Expanded(
          child: GridView.count(
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            padding: EdgeInsets.only(bottom: 2, top: 10),
            children: List.generate(
              this.selectedCategory.subCategories.length,
              (index) => GestureDetector(
                onTap: () async{
                  final doc = await FirebaseFirestore.instance
                            .collection("Items")
                            .doc('2')
                            .get();
                  var temp = MyItem.fromMap(doc.data() as Map<String, dynamic> );
                  // Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsPage(
                        subCategory: this.selectedCategory.subCategories[index],
                        // myItem: temp as MyItem,
                        // title: temp.title,
                        // description: temp.description,
                        // price: temp.price,
                        // guarantee_price: temp.guarantee_price,
                        // images: temp.images as List<String>,
                        // quantity: temp.quantity,
                        // status: temp.status,
                        // user_id: temp.user_id!,
                        
                      ),
                    ),
                  );
                },
                child: Column(
                  children: [
                    Badge(
                      position: BadgePosition.topStart(),
                      child: Container(
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
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15),
                          ),
                          child: Image.asset(
                            "assets/images/" +
                                this
                                    .selectedCategory
                                    .subCategories[index]
                                    .imgName +
                                ".jpg",
                            fit: BoxFit.cover,
                            width: 125,
                            height: 125,
                          ),
                        ),
                      ),
                      badgeContent: SizedBox(
                        width: 50, height: 30, //badge size
                        child: Center(
                          //align badge content to center
                          child: Text("New",
                              style: TextStyle(
                                  color: Colors.white, //badge font color
                                  fontSize: 16 //badge font size
                                  )),
                        ),
                      ),
                      badgeColor: this.selectedCategory.color,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        this.selectedCategory.subCategories[index].name,
                        style: const TextStyle(
                            color: Colors.black54, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
    // );
  }
}
