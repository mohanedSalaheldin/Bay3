import 'package:e_commerce/core/configs/routes/routes_name.dart';
import 'package:e_commerce/core/utils/shared/components/screens/offline_error_screen.dart';
import 'package:e_commerce/core/utils/shared/components/screens/server_error_screen.dart';
import 'package:e_commerce/core/utils/shared/components/widgets/loading_screen.dart';
import 'package:e_commerce/core/utils/shared/constants/assets_pathes.dart';
import 'package:e_commerce/core/utils/shared/models/product_model.dart';
import 'package:e_commerce/features/product/view/widgets/products_body.dart';
import 'package:e_commerce/features/product/view_model/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key, required this.model});
  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProductViewModel>(context);
    if (provider.productStates == ProductStates.loading) {
      return const LoadingScreen();
    } else if (provider.productStates == ProductStates.serverError) {
      return const ServerErrorScreen();
    } else if (provider.productStates == ProductStates.connectionError) {
      return const OfflineErrorScreen(
        currentScreenPath: RoutesName.product,
      );
    }

    return Scaffold(
      appBar: _buildAppBar(provider, context),
      body: ProductsBody(model: model),
    );
  }

  AppBar _buildAppBar(ProductViewModel provider, BuildContext context) {
    var provider = Provider.of<ProductViewModel>(context);

    return AppBar(
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
}
