import 'package:flutter/material.dart';
import 'package:mad_project/models/subcategory.dart';
import 'package:mad_project/pages/mappage.dart';
import 'package:mad_project/pages/userdetails.dart';
import 'package:mad_project/widgets/CategoryIcon.dart';
import 'package:mad_project/widgets/themebutton.dart';

import 'categorybottombar.dart';

class DetailsPage extends StatefulWidget {
  int days = 1;
  double cost = 0.0;
  SubCategory subCategory;
  DetailsPage({
    Key? key,
    required this.subCategory,
  }) : super(key: key);
  @override
  DetailsPageState createState() => DetailsPageState();
}

class DetailsPageState extends State<DetailsPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Stack(children: [
          Column(children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.only(bottomLeft: Radius.circular(50)),
              child: Stack(
                children: [
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/' +
                                widget.subCategory.imgName +
                                '.jpg'),
                            fit: BoxFit.cover)),
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                            Colors.black.withOpacity(0.5),
                            Colors.transparent
                          ])),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CategoryIcon(
                            color: widget.subCategory.color,
                            iconName: widget.subCategory.icon,
                            size: 28,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                widget.subCategory.name,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              SizedBox(height: 10),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: widget.subCategory.color,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text(
                                  "Rs " +
                                      widget.subCategory.price.toString() +
                                      "0/day",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  AppBar(
                    title: const Text(
                      "Rent itt",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent),
                    ),
                    backgroundColor: Colors.transparent,
                    elevation: 0.0,
                    iconTheme: const IconThemeData(color: Colors.redAccent),
                    actions: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(right: 5),
                        child: ClipOval(
                          child: Image.asset("assets/images/danish.jpeg"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 10),
                        child: Text.rich(TextSpan(children: [
                          const TextSpan(text: 'Available for '),
                          const TextSpan(
                              text: 'maximum ',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: '${widget.subCategory.MaxDays} days',
                              style: const TextStyle(fontSize: 22))
                        ])),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 10,
                                offset: Offset.zero,
                                color: Colors.black.withOpacity(0.1),
                              )
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: widget.days > 1
                                  ? () {
                                      //To decrement
                                      setState(() {
                                        widget.days--;
                                        widget.cost = widget.subCategory.price *
                                            widget.days;
                                      });
                                    }
                                  : null,
                              child: const Icon(
                                Icons.remove_circle_outline,
                                size: 50,
                                color: Colors.red,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Center(
                                  child: Text.rich(
                                    TextSpan(children: [
                                      TextSpan(
                                        text: widget.days.toString(),
                                        style: TextStyle(fontSize: 30),
                                      ),
                                      const TextSpan(
                                        text: ' days',
                                        style: TextStyle(fontSize: 20),
                                      )
                                    ]),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: widget.days < widget.subCategory.MaxDays
                                  ? () {
                                      //To Increment
                                      setState(() {
                                        widget.days++;
                                        widget.cost = widget.subCategory.price *
                                            widget.days;
                                      });
                                    }
                                  : null,
                              child: const Icon(
                                Icons.add_circle_outline,
                                size: 50,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10, right: 20, left: 20, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text.rich(
                              TextSpan(children: [
                                TextSpan(text: 'Total rent price: '),
                                TextSpan(
                                    text: 'Rs ' +
                                        widget.subCategory.price.toString() +
                                        '/day',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold))
                              ]),
                            ),
                            Text(
                              widget.cost > 0
                                  ? '${widget.cost}'
                                  : '${widget.cost = widget.subCategory.price}',
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: ThemeButton(
                            label: 'Rent it',
                            onClick: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => UserDetails(
                                            category: widget.subCategory.name,
                                            days: widget.days,
                                            cost: widget.cost,
                                          )));
                            },
                            icon: const Icon(
                              Icons.shopping_cart,
                              color: Colors.black,
                            ),
                            color: Colors.redAccent,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: ThemeButton(
                            label: 'Product Location',
                            onClick: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MapPage(
                                            subCategory: widget.subCategory,
                                          )));
                            },
                            icon: const Icon(
                              Icons.location_pin,
                              color: Colors.black,
                            ),
                            color: Colors.green,
                            highlight: Color.fromARGB(255, 20, 90, 22),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            )
          ]),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CategoryBottomBar(),
          )
        ]),
      ),
    );
  }
}
