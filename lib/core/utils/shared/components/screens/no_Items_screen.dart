import 'package:e_commerce/core/utils/shared/constants/assets_pathes.dart';
import 'package:e_commerce/core/utils/shared/screen_sizes/screen_sizes.dart';
import 'package:flutter/material.dart';

class NoItemsScreen extends StatelessWidget {
  const NoItemsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = ScreenSizes.getHeight(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image(
                height: height * .25,
                width: height * .25,
                fit: BoxFit.contain,
                image: const AssetImage(AssetsPathes.noFavoritesImage),
              ),
            ),
            const SizedBox(height: 20.0),
            const Text('No Items yet'),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
