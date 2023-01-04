import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:mad_project/models/subcategory.dart';
import 'package:mad_project/widgets/AppBar.dart';
import 'package:mad_project/widgets/DividerPlus.dart';

import '../core/constant/app_color.dart';
import '../core/constant/app_text.dart';
import '../product/widget/custom_elevated_button.dart';
import '../widgets/DetailsCarousal.dart';
import 'categorybottombar.dart';
import 'login_view.dart';

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
      appBar: MainAppBar(),
      body: Container(
        alignment: Alignment.center,
        child: Stack(children: [
          SingleChildScrollView(
            child: Container(
              height: 800,
              child: Column(children: [
                Stack(
                  children: [
                    Container(
                      height: 190,
                      child: DetailsCarousal(),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 5, right: 20, left: 20, bottom: 5),
                  child: Row(
                    children: [
                      Text.rich(
                        TextSpan(children: [
                          TextSpan(
                              text: 'Title: ',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                          TextSpan(
                            text: widget.subCategory.name,
                          )
                        ]),
                      ),
                    ],
                  ),
                ),
                dividerPlus(),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 5, right: 20, left: 20, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(children: [
                          TextSpan(
                              text: 'Price: ',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(
                            text: 'Rs ' +
                                widget.subCategory.price.toString() +
                                '/day',
                          )
                        ]),
                      ),
                      Text.rich(
                        TextSpan(children: [
                          TextSpan(
                              text: 'Guaranteed Price: ',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(
                            text: 'Rs ' + widget.subCategory.price.toString(),
                          )
                        ]),
                      ),
                    ],
                  ),
                ),
                dividerPlus(),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 0, right: 20, left: 20, bottom: 5),
                  child: Column(children: [
                    Text('Description: ',
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        )),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "To be filled description of the item",
                      maxLines: 4,
                      overflow: TextOverflow.clip,
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.justify,
                    ),
                  ]),
                ),
                dividerPlus(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 10),
                          child: Text.rich(TextSpan(children: [
                            const TextSpan(text: 'Available from '),
                            const TextSpan(
                                text: '{this date}',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    ' to {this date} ${widget.subCategory.MaxDays} days',
                                style: const TextStyle(fontSize: 16))
                          ])),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10, top: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text('Start Date and end date picker here'),
                                  // CalendarDatePicker(
                                  //   initialDate: DateTime.now(),
                                  //   firstDate: DateTime.now(),
                                  //   lastDate:
                                  //       DateTime.now().add(Duration(days: 365)),
                                  //   onDateChanged: (DateTime date) {
                                  //     setState(() {
                                  //       // widget.subCategory.startDate = date;
                                  //     });
                                  //   },
                                  // ),
                                ],
                              ),
                              Column()
                            ],
                          ),
                        ),
                        Container(
                          height: 50,
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(left: 20, right: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 8,
                                  offset: Offset.zero,
                                  color: Colors.black87.withOpacity(0.1),
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
                                          widget.cost =
                                              widget.subCategory.price *
                                                  widget.days;
                                        });
                                      }
                                    : null,
                                child: const Icon(
                                  Icons.remove_circle_outline,
                                  size: 35,
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
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        const TextSpan(
                                          text: ' day(s)',
                                          style: TextStyle(fontSize: 16),
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
                                          widget.cost =
                                              widget.subCategory.price *
                                                  widget.days;
                                        });
                                      }
                                    : null,
                                child: const Icon(
                                  Icons.add_circle_outline,
                                  size: 35,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, right: 25, left: 25, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text.rich(
                                TextSpan(children: [
                                  TextSpan(text: 'Total rent price: '),
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
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginView(
                                            // category: widget.subCategory.name,
                                            // days: widget.days,
                                            // cost: widget.cost,
                                            )));
                              },
                              child: CustomElevatedButton(
                                child: Text(
                                  AppText.rentit.toUpperCase(),
                                  style: const TextStyle(color: Colors.white),
                                ),
                                borderRadius: 20,
                                color: AppColors.uploadColor,
                                height: context.height * 0.07,
                                width: context.width * 0.4,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: CustomElevatedButton(
                                child: Text(
                                  AppText.ChatNow.toUpperCase(),
                                  style: const TextStyle(color: Colors.white),
                                ),
                                borderRadius: 20,
                                color: AppColors.chatColor,
                                height: context.height * 0.07,
                                width: context.width * 0.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                dividerPlus(),
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Your Offer Price:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: 180,
                        height: 40,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Enter Your Price",
                          ),
                          maxLines: 1,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Column(children: [
                    GestureDetector(
                      onTap: () {},
                      child: CustomElevatedButton(
                        child: Text(
                          "Send Offer".toUpperCase(),
                          style: const TextStyle(color: Colors.white),
                        ),
                        borderRadius: 20,
                        color: Color.fromARGB(255, 2, 65, 15),
                        height: context.height * 0.07,
                        width: context.width * 0.4,
                      ),
                    ),
                  ]),
                ),
              ]),
            ),
          ),
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
