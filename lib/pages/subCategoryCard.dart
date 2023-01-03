import 'package:flutter/material.dart';
import 'package:mad_project/models/subcategory.dart';

import '../widgets/CategoryIcon.dart';

class subCategorycard extends StatelessWidget {
  SubCategory category;
  Function onCardClick;
  int index1;

  subCategorycard(
      {Key? key,
      required this.category,
      required this.onCardClick,
      required this.index1})
      : super(key: key);

  @override
  Widget build(Object context) {
    return GestureDetector(
      onTap: () {
        this.onCardClick();
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        height: 70,
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            children: [
              CategoryIcon(
                color: this.category.color,
                iconName: this.category.icon,
                size: 20,
              ),
              const SizedBox(width: 10),
              Text(
                this.category.name,
                style: const TextStyle(color: Colors.black45, fontSize: 14),
              )
            ],
          ),
        ),
      ),
    );
  }
}
