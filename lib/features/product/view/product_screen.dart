import 'package:e_commerce/core/configs/styles/app_colors.dart';
import 'package:e_commerce/core/configs/styles/frequently_used_texts.dart';
import 'package:e_commerce/core/utils/shared/components/screens/offline_error_screen.dart';
import 'package:e_commerce/core/utils/shared/components/screens/server_error_screen.dart';
import 'package:e_commerce/core/utils/shared/components/widgets/default_button.dart';
import 'package:e_commerce/core/utils/shared/components/widgets/loading_screen.dart';
import 'package:e_commerce/core/utils/shared/components/widgets/see_more_text.dart';
import 'package:e_commerce/core/utils/shared/constants/assets_pathes.dart';
import 'package:e_commerce/core/utils/shared/models/product_model.dart';
import 'package:e_commerce/core/utils/shared/screen_sizes/screen_sizes.dart';
import 'package:e_commerce/features/cart/view/checkout_screen.dart';
import 'package:e_commerce/features/cart/view/widgets/card_title_with_action.dart';
import 'package:e_commerce/features/product/view/widgets/images_bannar.dart';
import 'package:e_commerce/features/product/view_model/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key, required this.model});
  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    var height = ScreenSizes.getHeight(context);
    var provider = Provider.of<ProductViewModel>(context);
    if (provider.productStates == ProductStates.loading) {
      return const LoadingScreen();
    } else if (provider.productStates == ProductStates.serverError) {
      return const ServerErrorScreen();
    } else if (provider.productStates == ProductStates.connectionError) {
      return const OfflineErrorScreen();
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              provider.addOrRemoveFavoriteProduct(model);
            },
            icon: SizedBox(
              width: 20.0,
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage(
                  _isThisItemInFavorites(model.id, context)
                      ? AssetsPathes.heartFilledIcon
                      : AssetsPathes.heartIcon,
                ),
              ),
            ),
          )
        ],
      ),
      body: CustomScrollView(
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
      ),
    );
  }

  bool _isThisItemInFavorites(int id, BuildContext context) {
    for (var element
        in Provider.of<ProductViewModel>(context).favoriteProducts) {
      if (element.id == id) {
        return true;
      }
    }
    return false;
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
