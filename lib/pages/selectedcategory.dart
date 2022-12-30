import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:mad_project/models/category.dart';
import 'package:mad_project/pages/detailspage.dart';
import 'package:mad_project/widgets/CategoryIcon.dart';

import 'categorybottombar.dart';

// ignore: must_be_immutable
class SelectedCategory extends StatelessWidget {
  Category selectedCategory;
  SelectedCategory({Key? key, required this.selectedCategory})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Rent it",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black87),
        actions: [
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(right: 5),
            child: IconButton(
              icon: Icon(Icons.notifications),
              onPressed: (() {}),
            ),
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(5),
        child: Stack(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CategoryIcon(
                      color: this.selectedCategory.color,
                      iconName: this.selectedCategory.icon,
                      size: 22,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      this.selectedCategory.name,
                      style: TextStyle(
                          color: this.selectedCategory.color,
                          fontSize: 26,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(height: 30),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    children: List.generate(
                      this.selectedCategory.subCategories.length,
                      (index) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsPage(
                                subCategory:
                                    this.selectedCategory.subCategories[index],
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
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black45,
                                      offset: const Offset(
                                        3.0,
                                        3.0,
                                      ), //Offset
                                      blurRadius: 5.0,
                                      spreadRadius: 1.0,
                                    )
                                  ],
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
                                  //aligh badge content to center
                                  child: Text("New",
                                      style: TextStyle(
                                          color:
                                              Colors.white, //badge font color
                                          fontSize: 16 //badge font size
                                          )),
                                ),
                              ),
                              badgeColor: this.selectedCategory.color,
                            ),
                            const SizedBox(width: 15),
                            Text(
                              this.selectedCategory.subCategories[index].name,
                              style: const TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Positioned(
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
