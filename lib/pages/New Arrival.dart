import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:mad_project/pages/upload.dart';

import '../models/category.dart';
import 'detailspage.dart';

class NewArrival extends StatefulWidget {
  Category selectedCategory;
  NewArrival({Key? key, required this.selectedCategory}) : super(key: key);

  @override
  State<NewArrival> createState() => _NewArrivalState();
}

class _NewArrivalState extends State<NewArrival> {
  var temp;
  Future<void> myItems() async {
    var mytemp = await FirebaseFirestore.instance.collection('/Items').get();
    List<Map<String, dynamic>> temp1 =
        mytemp.docs.map((doc) => doc.data()).toList();
    temp = temp1;

    //   builder: (_, snapshot) {
    //     if (snapshot.hasError) return Text('Error = ${snapshot.error}');

    //     if (snapshot.hasData) {
    //       temp = snapshot.data!.docs;
    //     }

    //     return Center(child: CircularProgressIndicator());
    //   },
    // );

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myItems();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // myItems();
    // return Scaffold(
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 20),
      child: (temp != null)
          ? Container(
              child: Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(bottom: 2, top: 10),
                  physics: const NeverScrollableScrollPhysics(),
                  children: List.generate(
                    temp.length,
                    (index) => Container(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsPage(
                                // subCategory: this.widget.selectedCategory.subCategories[2],
                                myItem_id: temp[index]['id'],
                              ),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            // Badge(
                            //   position: BadgePosition.topStart(),
                            //   child:
                            Container(
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
                                child:
                                    // Image.asset(
                                    //   "assets/images/" +
                                    //       this
                                    //           .widget.selectedCategory
                                    //           .subCategories[index]
                                    //           .imgName +
                                    //       ".jpg",
                                    Container(
                                  width: 125,
                                  height: 125,
                                  // margin: EdgeInsets.all(6.0),
                                  decoration: BoxDecoration(
                                    // borderRadius: BorderRadius.circular(8.0),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          temp[index]['images'][0]),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                // NetworkImage(
                                //   index['images'][0],)

                                //   fit: BoxFit.cover,
                                // ),
                              ),
                            ),
                            //   badgeContent: SizedBox(
                            //     width: 50, height: 30, //badge size
                            //     child: Center(
                            //       //align badge content to center
                            //       child: Text("New",
                            //           style: TextStyle(
                            //               color: Colors.white, //badge font color
                            //               fontSize: 16 //badge font size
                            //               )),
                            //     ),
                            //   ),
                            //   badgeColor: this.widget.selectedCategory.color,
                            // ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                temp[index]['title'],
                                style: const TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    // }
                    // else
                    // {
                    //   Container();
                    // }
                    // }
                  ).reversed.toList(),
                ),
              ),
            )
          : Container(),
      // )
    );
    // );
  }
}
