import 'package:flutter/material.dart';
import 'package:mad_project/models/category.dart';
import 'package:mad_project/models/categorypart.dart';
import 'package:mad_project/models/subcategory.dart';

class Utils {
  static List<Category> getMockedCategories() {
    return [
      Category(
          color: Colors.redAccent,
          name: "Fashion",
          imgName: "fashion",
          icon: Icons.store_mall_directory_outlined,
          subCategories: [
            SubCategory(
              name: "Denim Pant",
              icon: Icons.store_mall_directory_outlined,
              color: Colors.redAccent,
              price: 100,
              MaxDays: 20,
              imgName: 'pant',
              parts: [
                CategoryPart(name: "Danish", imgName: "pant", isSelected: true)
              ],
            ),
            SubCategory(
                name: "Shirt",
                icon: Icons.store_mall_directory_outlined,
                color: Colors.redAccent,
                price: 80,
                MaxDays: 30,
                imgName: 'shirt',
                parts: [
                  CategoryPart(
                      name: "Danish", imgName: "pant", isSelected: true)
                ]),
            SubCategory(
                name: "Trouser",
                MaxDays: 25,
                icon: Icons.store_mall_directory_outlined,
                color: Colors.redAccent,
                imgName: 'trouser',
                price: 60,
                parts: [
                  CategoryPart(
                      name: "Danish", imgName: "pant", isSelected: true)
                ]),
            SubCategory(
                name: "Shoes",
                icon: Icons.store_mall_directory_outlined,
                color: Colors.redAccent,
                MaxDays: 10,
                imgName: 'shoes',
                price: 50,
                parts: [
                  CategoryPart(
                      name: "Danish", imgName: "pant", isSelected: true)
                ]),
            SubCategory(
                name: "Bag",
                icon: Icons.store_mall_directory_outlined,
                color: Colors.redAccent,
                price: 40,
                MaxDays: 5,
                imgName: 'bag',
                parts: [
                  CategoryPart(
                      name: "Danish", imgName: "pant", isSelected: true)
                ]),
            SubCategory(
                name: "Capri Pant",
                icon: Icons.store_mall_directory_outlined,
                color: Colors.redAccent,
                MaxDays: 30,
                imgName: 'capri_pant',
                price: 25,
                parts: [
                  CategoryPart(
                      name: "Danish", imgName: "pant", isSelected: true)
                ]),
          ]),
      Category(
          color: Color.fromARGB(255, 6, 82, 45),
          name: "Electronics",
          imgName: "electronics",
          icon: Icons.electrical_services_outlined,
          subCategories: [
            SubCategory(
                name: "LED",
                icon: Icons.electrical_services_outlined,
                color: Color.fromARGB(255, 6, 82, 45),
                price: 120,
                MaxDays: 28,
                imgName: 'led',
                parts: []),
            SubCategory(
                name: "Microwave Oven",
                icon: Icons.electrical_services_outlined,
                color: Color.fromARGB(255, 6, 82, 45),
                price: 110,
                MaxDays: 22,
                imgName: 'micro_wave',
                parts: []),
            SubCategory(
                name: "Freezer",
                icon: Icons.electrical_services_outlined,
                color: Color.fromARGB(255, 6, 82, 45),
                price: 250,
                MaxDays: 30,
                imgName: 'freezer',
                parts: []),
            SubCategory(
                name: "Iron",
                icon: Icons.electrical_services_outlined,
                color: Color.fromARGB(255, 6, 82, 45),
                price: 80,
                MaxDays: 15,
                imgName: 'iron',
                parts: []),
            SubCategory(
                name: "Toaster",
                icon: Icons.electrical_services_outlined,
                color: Color.fromARGB(255, 6, 82, 45),
                price: 90,
                MaxDays: 60,
                imgName: 'toaster',
                parts: []),
            SubCategory(
                name: "Washing",
                icon: Icons.electrical_services_outlined,
                color: Color.fromARGB(255, 6, 82, 45),
                price: 200,
                MaxDays: 30,
                imgName: 'washing',
                parts: []),
          ]),
      Category(
          color: Colors.blueAccent,
          name: "Sports",
          imgName: "sports",
          icon: Icons.sports_outlined,
          subCategories: [
            SubCategory(
                name: "Hockey",
                icon: Icons.sports_hockey_outlined,
                color: Colors.blueAccent,
                price: 100,
                MaxDays: 12,
                imgName: 'hockey',
                parts: []),
            SubCategory(
                name: "Bat",
                icon: Icons.sports_cricket_outlined,
                color: Colors.blueAccent,
                price: 100,
                MaxDays: 19,
                imgName: 'bats',
                parts: []),
            SubCategory(
                name: "Football",
                icon: Icons.sports_football_outlined,
                color: Colors.blueAccent,
                price: 90,
                MaxDays: 33,
                imgName: 'football',
                parts: []),
            SubCategory(
                name: "Badminton",
                icon: Icons.sports_esports_outlined,
                color: Colors.blueAccent,
                price: 100,
                MaxDays: 30,
                imgName: 'badminton',
                parts: []),
            SubCategory(
                name: "Sports Net",
                icon: Icons.sports_handball_outlined,
                color: Colors.blueAccent,
                price: 80,
                MaxDays: 30,
                imgName: 'net',
                parts: []),
            SubCategory(
                name: "Baseball",
                icon: Icons.sports_baseball_outlined,
                color: Colors.blueAccent,
                price: 100,
                MaxDays: 20,
                imgName: 'baseball',
                parts: []),
          ]),
      Category(
          color: const Color.fromARGB(255, 235, 182, 8),
          name: "Automobiles",
          imgName: "automobiles",
          icon: Icons.car_rental_rounded,
          subCategories: [
            SubCategory(
                name: "Honda Civic",
                icon: Icons.car_rental_outlined,
                color: const Color.fromARGB(255, 235, 182, 8),
                price: 3000,
                MaxDays: 10,
                imgName: 'civic',
                parts: []),
            SubCategory(
                name: "Suzuki Bolan",
                icon: Icons.car_rental_outlined,
                color: const Color.fromARGB(255, 235, 182, 8),
                price: 2000,
                MaxDays: 15,
                imgName: 'bolan',
                parts: []),
            SubCategory(
                name: "Honda 125",
                icon: Icons.car_rental_outlined,
                color: const Color.fromARGB(255, 235, 182, 8),
                price: 800,
                MaxDays: 10,
                imgName: 'honda125',
                parts: []),
            SubCategory(
                name: "Kia Sportage",
                icon: Icons.car_rental_outlined,
                color: const Color.fromARGB(255, 235, 182, 8),
                price: 4500,
                MaxDays: 12,
                imgName: 'sporatge',
                parts: []),
            SubCategory(
                name: "Suzuki Cultus",
                icon: Icons.car_rental_outlined,
                color: const Color.fromARGB(255, 235, 182, 8),
                price: 3800,
                MaxDays: 14,
                imgName: 'cultus',
                parts: []),
            SubCategory(
                name: "Auto Rickshaw",
                icon: Icons.car_rental_outlined,
                color: const Color.fromARGB(255, 235, 182, 8),
                price: 800,
                MaxDays: 25,
                imgName: 'auto',
                parts: []),
          ]),
      Category(
          color: Colors.pinkAccent,
          name: "Crockery",
          imgName: "property",
          icon: Icons.dining_sharp,
          subCategories: [
            SubCategory(
                name: "Apartment",
                icon: Icons.house_outlined,
                color: Colors.pinkAccent,
                price: 2000,
                MaxDays: 18,
                imgName: 'apartment',
                parts: []),
            SubCategory(
                name: "House 6Marla",
                icon: Icons.house_outlined,
                color: Colors.pinkAccent,
                price: 1200,
                MaxDays: 12,
                imgName: 'house6',
                parts: []),
            SubCategory(
                name: "Penthouse",
                icon: Icons.house_outlined,
                color: Colors.pinkAccent,
                price: 3000,
                MaxDays: 60,
                imgName: 'penthouse',
                parts: []),
            SubCategory(
                name: "House 5Marla",
                icon: Icons.house_outlined,
                color: Colors.pinkAccent,
                price: 1000,
                MaxDays: 25,
                imgName: 'house5',
                parts: []),
            SubCategory(
                name: "Farms",
                icon: Icons.house_outlined,
                color: Colors.pinkAccent,
                price: 300,
                MaxDays: 25,
                imgName: 'farms',
                parts: []),
            SubCategory(
                name: "Farmhouse",
                icon: Icons.house_outlined,
                color: Colors.pinkAccent,
                price: 7000,
                MaxDays: 5,
                imgName: 'farmhouse',
                parts: []),
          ])
    ];
  }
}
