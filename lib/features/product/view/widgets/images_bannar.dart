import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/core/utils/shared/screen_sizes/screen_sizes.dart';
import 'package:flutter/material.dart';

class ProductImagesBannar extends StatelessWidget {
  const ProductImagesBannar({super.key, required this.images});
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    var height = ScreenSizes.getHeight(context);
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: height * .35,
      child: CarouselSlider(
        items: buildListOfImages(images),
        options: CarouselOptions(
          height: height * .35,
          aspectRatio: 16 / 9,
          viewportFraction: 0.9,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 1200),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }

  List<Widget> buildListOfImages(List<String> urls) {
    List<Widget> widgets = [];
    for (var element in urls) {
      widgets.add(
        Image(
          fit: BoxFit.contain,
          image: NetworkImage(element),
        ),
      );
    }
    return widgets;
  }
}
