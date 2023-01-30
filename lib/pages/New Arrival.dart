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
  var temp ;
  Future<void> myItem() async{    
      temp = await FirebaseFirestore.instance.collection('/Items').snapshots();
      print("================================"+temp);
    //   builder: (_, snapshot) {
    //     if (snapshot.hasError) return Text('Error = ${snapshot.error}');

    //     if (snapshot.hasData) {
    //       temp = snapshot.data!.docs;
    //     }

    //     return Center(child: CircularProgressIndicator());
    //   },
    // );
            
    setState(() {
      
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myItem();
    setState(() {
      
    });
  }
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 20),
      child: 
      
      Container(
        height: 650,
        child: Expanded(
          child: GridView.count(
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            padding: EdgeInsets.only(bottom: 2, top: 10),
            children: 
            
            
            List.generate(
              6,
              temp!.map((itm) => 
              {
                if(itm.id >= temp.length - 6)
                {
                  GestureDetector(
                    onTap: () {
                      // Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsPage(
                            subCategory: this.widget.selectedCategory.subCategories[2],
                            myItem: itm as MyItem,                            
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
                                  image:  DecorationImage(
                                    image: NetworkImage(itm['images'][0]),
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
                          badgeColor: this.widget.selectedCategory.color,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            itm['title'],
                            style: const TextStyle(
                                color: Colors.black54, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                }
              }
            ),
          ),
        ),
      ),
    ));
    // );
  }
}
