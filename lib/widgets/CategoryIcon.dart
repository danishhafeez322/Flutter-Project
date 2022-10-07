import 'package:flutter/material.dart';

class CategoryIcon extends StatelessWidget {
  Color color;
  IconData iconName;
  double size;
  double padding;

  CategoryIcon(
      {required this.color,
      required this.iconName,
      required this.size,
      this.padding: 10});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        color: this.color,
        padding: const EdgeInsets.all(10),
        child: Icon(
          this.iconName,
          size: this.size,
        ),
      ),
    );
  }
}
