import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DetailsCarousal extends StatefulWidget {
  var images;
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
          items: widget.images
              .map<Widget>((i) => Container(
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        // image: NetworkImage(widget.images[i]),
                        image: CachedNetworkImageProvider(i),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ))
              .toList(growable: false),
          // ),

          //Slider Container properties
          options: CarouselOptions(
            height: (kIsWeb) ? (300) : (180.0),
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
