import 'package:e_commerce/core/configs/styles/frequently_used_texts.dart';
import 'package:e_commerce/core/utils/shared/models/product_model.dart';
import 'package:e_commerce/core/utils/shared/screen_sizes/screen_sizes.dart';
import 'package:e_commerce/features/product/view/product_screen.dart';
import 'package:e_commerce/features/product/view_model/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchProductItem extends StatelessWidget {
  const SearchProductItem({
    super.key,
    required this.productModel,
  });
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    double height = ScreenSizes.getHeight(context);
    return InkWell(
      onTap: () {
        Provider.of<ProductViewModel>(context, listen: false).getFavorites();
        Provider.of<ProductViewModel>(context, listen: false).getCarts();
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductScreen(
                model: productModel,
              ),
            ));
      },
      child: Container(
        width: height / 6,
        height: height / 3.2,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                // width: height / 5.5,
                width: double.infinity,
                height: height / 2.5 - (height / 8),
                decoration: const BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      spreadRadius: .2,
                      blurStyle: BlurStyle.outer,
                      color: Color.fromARGB(255, 217, 216, 216),
                      blurRadius: 15,
                      offset: Offset(.2, .05),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: height / 12),
                    Column(
                      children: [
                        ProductNameText(productName: productModel.name),
                        PriceText(
                          price: productModel.price.toString(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                color: Colors.white,
                height: height * .13,
                child: Image(
                  fit: BoxFit.contain,
                  image: NetworkImage(productModel.image),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
