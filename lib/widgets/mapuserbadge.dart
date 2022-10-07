import 'package:flutter/material.dart';

class MapUserBadge extends StatelessWidget {
  bool isSelected;
  MapUserBadge({Key? key, this.isSelected = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
      decoration: BoxDecoration(
          color: this.isSelected ? Colors.redAccent : Colors.white,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: Offset.zero,
            )
          ]),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                image: const DecorationImage(
                    image: AssetImage('assets/images/danish.jpeg'),
                    fit: BoxFit.cover),
                border: Border.all(
                    color: this.isSelected ? Colors.redAccent : Colors.white,
                    width: 1)),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Danish Hafeez',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: this.isSelected ? Colors.white : Colors.grey),
                ),
                Text(
                  'My Location',
                  style: TextStyle(
                    color: this.isSelected ? Colors.white : Colors.redAccent,
                  ),
                )
              ],
            ),
          ),
          Icon(
            Icons.location_pin,
            color: this.isSelected ? Colors.white : Colors.redAccent,
            size: 40,
          )
        ],
      ),
    );
  }
}
