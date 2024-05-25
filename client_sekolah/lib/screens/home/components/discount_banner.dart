import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DiscountBanner extends StatefulWidget {
  const DiscountBanner({Key? key}) : super(key: key);

  @override
  _DiscountBannerState createState() => _DiscountBannerState();
}

class _DiscountBannerState extends State<DiscountBanner> {
  final List<String> _imagePaths = [
    "assets/images/sd17.png",
    "assets/images/sdn17_2.png",
    "assets/images/sdn17_3.png",
  ];

  int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      child: CarouselSlider.builder(
        itemCount: _imagePaths.length,
        itemBuilder: (BuildContext context, int index, int realIndex) {
          return Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(
                horizontal: 10), // Jarak antara gambar
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(_imagePaths[index]),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
        options: CarouselOptions(
          height: 200, // Set the height of the carousel
          autoPlay: true, // Auto slide images
          autoPlayInterval: Duration(seconds: 3), // Slide every 3 seconds
          onPageChanged: (index, reason) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
