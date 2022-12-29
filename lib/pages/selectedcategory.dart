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
        iconTheme: const IconThemeData(color: Colors.black54),
        actions: [
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(right: 5),
            child: ClipOval(
              child: Image.asset("assets/images/danish.jpeg"),
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
                            Image.asset(
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
                            const SizedBox(width: 10),
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
