import 'package:e_commerce/core/configs/styles/app_colors.dart';
import 'package:e_commerce/core/configs/styles/frequently_used_texts.dart';
import 'package:e_commerce/core/utils/shared/components/widgets/default_button.dart';
import 'package:e_commerce/core/utils/shared/components/widgets/see_more_text.dart';
import 'package:e_commerce/core/utils/shared/models/product_model.dart';
import 'package:e_commerce/core/utils/shared/screen_sizes/screen_sizes.dart';
import 'package:e_commerce/features/cart/view/widgets/card_title_with_action.dart';
import 'package:e_commerce/features/product/view/widgets/images_bannar.dart';
import 'package:e_commerce/features/product/view_model/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ProductsBody extends StatelessWidget {
  const ProductsBody({super.key, required this.model});
  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    var height = ScreenSizes.getHeight(context);
    var provider = Provider.of<ProductViewModel>(context);
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ProductImagesBannar(images: model.images),
              SizedBox(
                height: height * .02,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: ProductNameText(
                  productName: model.name,
                  size: 24,
                ),
              ),
              SizedBox(
                height: height * .02,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: SeeMoreTextWidget(text: model.description),
              ),
              SizedBox(
                height: height * .02,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: CardTitleWithAction(
                  title: 'Total',
                  actionWidget: PriceText(
                    price: model.price.toString(),
                  ),
                ),
              ),
              SizedBox(
                height: height * .02,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 30.0, horizontal: 30.0),
                child: ConfirmButton(
                  backgoungColor: _isThisItemInCart(model.id, context)
                      ? Colors.black
                      : AppColors.mainColor,
                  txt: _isThisItemInCart(model.id, context)
                      ? 'Remove from basket'
                      : 'Add To basket',
                  onPressed: () {
                    provider.addOrRemoveCartProduct(model);
                  },
                ),
              ),
            ],
          ),
        ),
      ],
      physics: const AlwaysScrollableScrollPhysics(),
    );
  }


  bool _isThisItemInCart(int id, BuildContext context) {
    for (var element in Provider.of<ProductViewModel>(context).cartProducts) {
      if (element.id == id) {
        return true;
      }
    }
    return false;
  }
}