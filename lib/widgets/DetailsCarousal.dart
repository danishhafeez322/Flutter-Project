import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DetailsCarousal extends StatefulWidget {
  List<String> images;
  DetailsCarousal({required this.images});

  @override
  State<DetailsCarousal> createState() => _DetailsCarousalState();
}

class _DetailsCarousalState extends State<DetailsCarousal> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      children: [
        CarouselSlider(
          items:
              //1st Image of Slider
              widget.images
                  .map<Widget>((i) => Container(
                        margin: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: NetworkImage(widget.images[0]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ))
                  .toList(growable: false),

          // ListView(
          //   children: [
          //     Container(
          //       margin: EdgeInsets.all(6.0),
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(8.0),
          //         image:  DecorationImage(
          //           image: NetworkImage(
          //               widget.images[0]),
          //           fit: BoxFit.cover,
          //         ),
          //       ),
          //     ),
          //   ],
          // ),

          // //2nd Image of Slider
          // Container(
          //   margin: EdgeInsets.all(6.0),
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(8.0),
          //     image: const DecorationImage(
          //       image: NetworkImage(
          //           "https://www.learningtomorrow.org/wp-content/uploads/2020/12/bigstock-Home-appliances-Seamless-patte-82338212-650x350.jpg"),
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          // ),

          // //3rd Image of Slider
          // Container(
          //   margin: EdgeInsets.all(6.0),
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(8.0),
          //     image: const DecorationImage(
          //       image: NetworkImage(
          //           "https://www.realmenrealstyle.com/wp-content/uploads/2021/09/custom-mens-clothing.jpg"),
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          // ),

          // //4th Image of Slider
          // Container(
          //   margin: EdgeInsets.all(6.0),
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(8.0),
          //     image: const DecorationImage(
          //       image: NetworkImage(
          //           "https://assets.architecturaldigest.in/photos/60084fc951daf9662c149bb9/master/pass/how-to-clean-gadgets-1366x768.jpg"),
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          // ),

          // //5th Image of Slider
          // Container(
          //   margin: EdgeInsets.all(6.0),
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(8.0),
          //     image: const DecorationImage(
          //       image: NetworkImage(
          //           "https://absoluteworks.co.uk/wp-content/uploads/2021/05/sport_3.jpg"),
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          // ),

          // Container(
          //   margin: EdgeInsets.all(6.0),
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(8.0),
          //     image: const DecorationImage(
          //       image: NetworkImage(
          //           "https://wallpapercave.com/wp/wp7334043.jpg"),
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          // ),

          //Slider Container properties
          options: CarouselOptions(
            height: 180.0,
            // enlargeCenterPage: true,
            // autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            viewportFraction: 0.9,
          ),
        ),
      ],
    );
  }
}
