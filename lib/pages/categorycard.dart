import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mad_project/models/category.dart';

import '../widgets/CategoryIcon.dart';

class Categorycard extends StatelessWidget {
  var category;
  Function onCardClick;

  Categorycard({
    Key? key,
    required this.category,
    required this.onCardClick,
  }) : super(key: key);

  @override
  Widget build(Object context) {
    return GestureDetector(
      onTap: () {
        this.onCardClick();
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        height: (kIsWeb)? (120):(70),
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            children: [
              CategoryIcon(
                color: this.category.color,
                iconName: this.category.icon,
                size: (kIsWeb)? (40):(20),
              ),
              const SizedBox(width: (kIsWeb)? (20):(10)),
              Text(
                this.category.name,
                style: const TextStyle(color: Colors.black45, fontSize: (kIsWeb)? (20):(14)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
