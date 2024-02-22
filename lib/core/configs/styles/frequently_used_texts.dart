import 'package:e_commerce/core/configs/styles/app_colors.dart';
import 'package:flutter/material.dart';

class ProductNameText extends StatelessWidget {
  const ProductNameText({
    super.key,
    required this.productName,
    this.size = 20.0,
    this.align = TextAlign.center,
  });
  final String productName;
  final double size;
  final TextAlign? align;

  @override
  Widget build(BuildContext context) {
    return Text(
      productName,
      maxLines: 2,
      textAlign: align,
      style: TextStyle(
        color: Colors.black,
        fontSize: size,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class PriceText extends StatelessWidget {
  const PriceText({
    super.key,
    required this.price,
    this.size = 18,
  });
  final String price;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Text(
      '\$$price',
      style: TextStyle(
        color: AppColors.mainColor,
        fontSize: size,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
