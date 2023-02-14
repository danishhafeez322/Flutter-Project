
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:mad_project/models/category.dart';
import 'package:mad_project/pages/detailspage.dart';
import 'package:mad_project/widgets/AppBar.dart';

import '../helper/utils.dart';
import 'categorybottombar.dart';
import 'myTemp.dart';

// ignore: must_be_immutable
class SelectedCategory extends StatefulWidget {
  Category selectedCategory;

  SelectedCategory({Key? key, required this.selectedCategory})
      : super(key: key);

  @override
  State<SelectedCategory> createState() => _SelectedCategoryState();
}

class _SelectedCategoryState extends State<SelectedCategory> {
  List<Category> categories = Utils.getMockedCategories();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 18.0),
              child: SingleChildScrollView(
                child: Container(
                  height: 800,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.black54, width: 1)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // CategoryIcon(
                            //   color: this.selectedCategory.color,
                            //   iconName: this.selectedCategory.icon,
                            //   size: 22,
                            // ),
                            // const SizedBox(
                            //   width: 10,
                            // ),
                            Text(
                              this.widget.selectedCategory.name,
                              style: TextStyle(
                                  color: this.widget.selectedCategory.color,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 25),
                      
                      MyCategory(type:this.widget.selectedCategory.name),
                      // Container(
                      //   height: 530,
                      //   child: Expanded(
                      //     child: GridView.count(
                      //       physics: NeverScrollableScrollPhysics(),
                      //       crossAxisCount: 2,
                      //       children: List.generate(
                      //         this.widget.selectedCategory.subCategories.length,
                      //         (index) => GestureDetector(
                      //           onTap: () {
                      //             //Navigator.pop(context);
                      //             Navigator.push(
                      //               context,
                      //               MaterialPageRoute(
                      //                 builder: (context) => DetailsPage(
                      //                   // subCategory: this
                      //                   //     .selectedCategory
                      //                   //     .subCategories[index],
                      //                   // myItem: 

                      //                 ),
                      //               ),
                      //             );
                      //           },
                      //           child: Container(
                      //             padding: EdgeInsets.only(bottom: 20),
                      //             child: Column(
                      //               children: [
                      //                 // Badge(
                      //                 //   position: BadgePosition.topStart(),
                      //                 //   child: 
                      //                   Container(
                      //                     decoration: BoxDecoration(
                      //                       shape: BoxShape.rectangle,
                      //                       border: Border.all(
                      //                         color: Colors.black54,
                      //                         width: 1,
                      //                       ),
                      //                       boxShadow: [
                      //                         BoxShadow(
                      //                           color: Colors.black45,
                      //                           offset: const Offset(
                      //                             2.0,
                      //                             2.0,
                      //                           ), //Offset
                      //                           blurRadius: 4.0,
                      //                           spreadRadius: 1.0,
                      //                         )
                      //                       ],
                      //                       borderRadius:
                      //                           const BorderRadius.all(
                      //                         Radius.circular(15),
                      //                       ),
                      //                     ),
                      //                     child: ClipRRect(
                      //                       borderRadius:
                      //                           const BorderRadius.all(
                      //                         Radius.circular(15),
                      //                       ),
                      //                       child: Image.asset(
                      //                         "assets/images/" +
                      //                             this
                      //                                 .widget
                      //                                 .selectedCategory
                      //                                 .subCategories[index]
                      //                                 .imgName +
                      //                             ".jpg",
                      //                         fit: BoxFit.cover,
                      //                         width: 125,
                      //                         height: 125,
                      //                       ),
                      //                     ),
                      //                   ),
                      //                 //   badgeContent: SizedBox(
                      //                 //     width: 50, height: 30, //badge size
                      //                 //     child: Center(
                      //                 //       //align badge content to center
                      //                 //       child: Text("New",
                      //                 //           style: TextStyle(
                      //                 //               color: Colors
                      //                 //                   .white, //badge font color
                      //                 //               fontSize:
                      //                 //                   16 //badge font size
                      //                 //               )),
                      //                 //     ),
                      //                 //   ),
                      //                 //   badgeColor: this.selectedCategory.color,
                      //                 // ),
                      //                 Padding(
                      //                   padding: const EdgeInsets.only(top: 8),
                      //                   child: Text(
                      //                     this
                      //                         .widget
                      //                         .selectedCategory
                      //                         .subCategories[index]
                      //                         .name,
                      //                     style: const TextStyle(
                      //                         color: Colors.black54,
                      //                         fontWeight: FontWeight.bold),
                      //                   ),
                      //                 )
                      //               ],
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: CategoryBottomBar(),
            )
          ],
        ),
      ),
    );
  }
}
