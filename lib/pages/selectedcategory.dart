
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
