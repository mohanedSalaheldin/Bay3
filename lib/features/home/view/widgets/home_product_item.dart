import 'package:e_commerce/core/configs/styles/frequently_used_texts.dart';
import 'package:e_commerce/core/utils/shared/models/product_model.dart';
import 'package:e_commerce/core/utils/shared/screen_sizes/screen_sizes.dart';
import 'package:e_commerce/features/product/view/product_screen.dart';
import 'package:e_commerce/features/product/view_model/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeProductItem extends StatelessWidget {
  const HomeProductItem({
    super.key,
    required this.productModel,
  });
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    double height = ScreenSizes.getHeight(context);
    return InkWell(
      splashColor: Colors.white,
      highlightColor: Colors.white,
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
        width: height / 3.5,
        height: height / 2.6,
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
                width: height / 3.5,
                height: height / 2.6 - (height / 13),
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
                    Radius.circular(
                      20,
                    ),
                  ),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: height / 15,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ProductNameText(
                              productName: productModel.name,
                              size: 22,
                            ),
                          ),
                          PriceText(
                            price: productModel.price.toString(),
                          ),
                        ],
                      ),
                    ]),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                height: height * .2,
                width: height * .2,
                child: Image(
                  height: height * .2,
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
