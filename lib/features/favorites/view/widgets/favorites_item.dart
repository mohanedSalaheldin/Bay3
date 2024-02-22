import 'package:e_commerce/core/configs/styles/frequently_used_texts.dart';
import 'package:e_commerce/core/utils/shared/screen_sizes/screen_sizes.dart';
import 'package:e_commerce/features/favorites/view_model/favorites_view_model.dart';
import 'package:e_commerce/features/product/model/favorite_and_cart_product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class FavoritesPruductItem extends StatelessWidget {
  const FavoritesPruductItem({
    super.key,
    required this.index,
    required this.productModel,
  });
  final String index;
  final FavoriteOrCartProductModel productModel;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<FavoritesViewModel>(context);
    var height = ScreenSizes.getHeight(context);
    return Slidable(
      key: Key(productModel.name),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(
          onDismissed: () {
            provider.removeFavoritesItem(productModel, int.parse(index));
          },
        ),
        children: [
          SlidableAction(
            onPressed: (context) {
              provider.removeFavoritesItem(productModel, int.parse(index));
            },
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: Container(
        height: height * .15,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Container(
                color: Colors.white,
                height: height * .12,
                width: height * .12,
                child: Image(
                  fit: BoxFit.contain,
                  image: NetworkImage(productModel.image),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 150.0,
                    child: ProductNameText(
                      align: TextAlign.start,
                      productName: productModel.name,
                      size: 16,
                    ),
                  ),
                  PriceText(
                    price: productModel.price.toString(),
                    size: 16,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
