import 'package:flutter/material.dart';
import 'package:mad_project/models/subcategory.dart';

import 'CategoryIcon.dart';

class MapBottomPil extends StatelessWidget {
  SubCategory subCategory;

  MapBottomPil({Key? key, required this.subCategory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: Offset.zero)
        ],
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            color: Colors.white,
            child: Row(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    ClipOval(
                      child: Image.asset(
                        'assets/images/${this.subCategory.imgName}.jpg',
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: -10,
                      right: -10,
                      child: CategoryIcon(
                        color: Colors.redAccent,
                        iconName: Icons.category_outlined,
                        size: 18,
                        padding: 5,
                      ),
                    )
                  ],
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        subCategory.name,
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      const Text(
                        '20km away',
                        style: TextStyle(
                          color: Colors.redAccent,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.location_pin,
                  color: Colors.black87,
                  size: 45,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
