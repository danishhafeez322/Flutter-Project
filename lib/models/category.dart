import 'package:flutter/material.dart';
import 'package:mad_project/models/subcategory.dart';

class Category {
  String name;
  IconData icon;
  Color color;
  String imgName;
  List<SubCategory> subCategories;

  Category(
      {required this.name,
      required this.icon,
      required this.color,
      required this.imgName,
      required this.subCategories});
}
