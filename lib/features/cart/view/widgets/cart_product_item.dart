import 'package:e_commerce/core/configs/styles/frequently_used_texts.dart';
import 'package:e_commerce/core/utils/shared/constants/assets_pathes.dart';
import 'package:e_commerce/core/utils/shared/screen_sizes/screen_sizes.dart';
import 'package:e_commerce/features/cart/view_model/cart_view_model.dart';
import 'package:e_commerce/features/product/model/favorite_and_cart_product_model.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CartPruductItem extends StatelessWidget {
  const CartPruductItem({
    super.key,
    required this.index,
    required this.productModel,
  });
  final String index;
  final FavoriteOrCartProductModel productModel;

  @override
  Widget build(BuildContext context) {
    var height = ScreenSizes.getHeight(context);
    return Slidable(
      key: Key(productModel.name),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(
          onDismissed: () {
            Provider.of<CartViewModel>(context, listen: false)
                .removeCartItem(productModel, int.parse(index));
          },
        ),
        children: [
          SlidableAction(
            onPressed: (context) {
              Provider.of<CartViewModel>(context, listen: false)
                  .removeCartItem(productModel, int.parse(index));
            },
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: Container(
        height: height * .20,
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
                  Consumer<CartViewModel>(
                    builder: (context, provider, child) => Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Quantity: ',
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(
                          height: 25.0,
                          width: 25.0,
                          child: FloatingActionButton(
                            heroTag: 't$index',
                            onPressed: () {
                              provider.removeQuantity(productModel.id);
                            },
                            isExtended: true,
                            backgroundColor: HexColor('#7dcceb'),
                            child: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Text(
                            provider.productQuantities[productModel.id]
                                .toString(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 24.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25.0,
                          width: 25.0,
                          child: FloatingActionButton(
                            onPressed: () {
                              provider.addQuantity(productModel.id);
                            },
                            heroTag: index,
                            isExtended: true,
                            backgroundColor: HexColor('#7dcceb'),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
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
