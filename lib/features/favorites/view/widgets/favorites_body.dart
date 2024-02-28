import 'package:e_commerce/core/configs/routes/routes_name.dart';
import 'package:e_commerce/core/utils/shared/components/screens/no_items_screen.dart';
import 'package:e_commerce/core/utils/shared/components/screens/offline_error_screen.dart';
import 'package:e_commerce/core/utils/shared/components/screens/server_error_screen.dart';
import 'package:e_commerce/core/utils/shared/components/widgets/loading_screen.dart';
import 'package:e_commerce/features/favorites/view/widgets/favorites_item.dart';
import 'package:e_commerce/features/favorites/view_model/favorites_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget buildFavoritesBody(BuildContext context) {
  var provider = Provider.of<FavoritesViewModel>(context);
  if (provider.favoritesStates == FavoritesStates.loading) {
    return const LoadingScreen();
  } else if (provider.favoritesStates == FavoritesStates.serverError) {
    return const ServerErrorScreen();
  } else if (provider.favoritesStates == FavoritesStates.connectionError) {
    return const OfflineErrorScreen(
      currentScreenPath: RoutesName.favorites,
    );
  }
  if (provider.favoritessProducts.isEmpty) {
    return const NoItemsScreen();
  }
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
    child: Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) => FavoritesPruductItem(
                index: index.toString(),
                productModel: provider.favoritessProducts[index]),
            separatorBuilder: (context, index) => const SizedBox(height: 15),
            itemCount: provider.favoritessProducts.length,
          ),
        ),
      ],
    ),
  );
}
