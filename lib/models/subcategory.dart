import 'package:flutter/cupertino.dart';
import 'package:mad_project/models/category.dart';
import 'package:mad_project/models/categorypart.dart';

class SubCategory extends Category {
  List<CategoryPart> parts;
  double price;
  int MaxDays;
  SubCategory(
      {required String name,
      required this.parts,
      required IconData icon,
      required Color color,
      required this.price,
      required this.MaxDays,
      required String imgName})
      : super(
            name: name,
            icon: icon,
            color: color,
            imgName: imgName,
            subCategories: []);
}
