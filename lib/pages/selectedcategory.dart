import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:mad_project/models/category.dart';
import 'package:mad_project/pages/detailspage.dart';
import 'package:mad_project/pages/subCategoryCard.dart';
import 'package:mad_project/widgets/AppBar.dart';

import '../helper/utils.dart';
import 'categorybottombar.dart';

// ignore: must_be_immutable
class SelectedCategory extends StatelessWidget {
  Category selectedCategory;
  List<Category> categories = Utils.getMockedCategories();

  SelectedCategory({Key? key, required this.selectedCategory})
      : super(key: key);
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
                              this.selectedCategory.name,
                              style: TextStyle(
                                  color: this.selectedCategory.color,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 0.0),
                        child: Container(
                          height: 80,
                          child: Expanded(
                            child: Container(
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount:
                                    this.selectedCategory.subCategories.length,
                                itemBuilder: (BuildContext ctx, int index) {
                                  return subCategorycard(
                                      index1: index,
                                      category:
                                          selectedCategory.subCategories[index],
                                      onCardClick: () {
                                        Navigator.push(
                                          ctx,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                SelectedCategory(
                                                    selectedCategory:
                                                        categories[index]),
                                          ),
                                        );
                                      });
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      Container(
                        height: 530,
                        child: Expanded(
                          child: GridView.count(
                            physics: NeverScrollableScrollPhysics(),
                            crossAxisCount: 2,
                            children: List.generate(
                              this.selectedCategory.subCategories.length,
                              (index) => GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailsPage(
                                        subCategory: this
                                            .selectedCategory
                                            .subCategories[index],
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  padding: EdgeInsets.only(bottom: 20),
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
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(15),
                                            ),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                const BorderRadius.all(
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
                                                    color: Colors
                                                        .white, //badge font color
                                                    fontSize:
                                                        16 //badge font size
                                                    )),
                                          ),
                                        ),
                                        badgeColor: this.selectedCategory.color,
                                      ),
                                      const SizedBox(width: 15),
                                      Text(
                                        this
                                            .selectedCategory
                                            .subCategories[index]
                                            .name,
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
                        ),
                      ),
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
