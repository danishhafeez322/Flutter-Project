import 'package:flutter/material.dart';
import 'package:mad_project/models/category.dart';

import '../widgets/CategoryIcon.dart';

class Categorycard extends StatelessWidget {
  Category category;
  Function onCardClick;

  Categorycard({Key? key, required this.category, required this.onCardClick})
      : super(key: key);

  @override
  Widget build(Object context) {
    return GestureDetector(
      onTap: () {
        this.onCardClick();
      },
      child: Container(
        margin: const EdgeInsets.all(20),
        height: 150,
        child: Stack(
          children: [
            Positioned.fill(
                child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                "assets/images/${this.category.imgName}.jpg",
                fit: BoxFit.cover,
              ),
            )),
            Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  height: 120,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withOpacity(0.7),
                            Colors.transparent
                          ])),
                )),
            Positioned(
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    CategoryIcon(
                      color: this.category.color,
                      iconName: this.category.icon,
                      size: 20,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      this.category.name,
                      style: const TextStyle(color: Colors.white, fontSize: 25),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
