import 'package:e_commerce/core/configs/styles/app_colors.dart';
import 'package:e_commerce/core/utils/shared/components/screens/offline_error_screen.dart';
import 'package:e_commerce/core/utils/shared/components/screens/server_error_screen.dart';
import 'package:e_commerce/core/utils/shared/components/widgets/loading_screen.dart';
import 'package:e_commerce/core/utils/shared/screen_sizes/screen_sizes.dart';
import 'package:e_commerce/features/home/view/widgets/catigory_items.dart';
import 'package:e_commerce/features/home/view/widgets/home_product_item.dart';
import 'package:e_commerce/features/home/view/widgets/upper_container.dart';
import 'package:e_commerce/features/home/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = ScreenSizes.getHeight(context);
    double width = ScreenSizes.getWidth(context);

    return Consumer<HomeViewModel>(
      builder: (context, provider, child) {
        if (provider.homeStates == HomeStates.loading) {
          return const LoadingScreen();
        } else if (provider.homeStates == HomeStates.serverError) {
          return const ServerErrorScreen();
        } else if (provider.homeStates == HomeStates.connectionError) {
          return const OfflineErrorScreen();
        }
        List<List> categoryTaps = [
          provider.electronicsProducts,
          provider.clothesProducts,
          provider.sportProducts,
          provider.coronaProducts,
        ];
        return Scaffold(
          body: Padding(
            padding: const EdgeInsetsDirectional.only(start: 30),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 0.0),
                const UpperContainer(),
                const CatogeryTitleItemsList(),
                SizedBox(
                  height: height / 2.5,
                  child: categoryTaps[provider.currentCategory].isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(
                              color: AppColors.mainColor),
                        )
                      : ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => HomeProductItem(
                            productModel: categoryTaps[provider.currentCategory]
                                [index],
                          ),
                          separatorBuilder: (context, index) =>
                              SizedBox(width: width / 12),
                          itemCount:
                              categoryTaps[provider.currentCategory].length,
                        ),
                ),
                const SeeMoreButton()
              ],
            ),
          ),
        );
      },
    );
  }
}

class SeeMoreButton extends StatelessWidget {
  const SeeMoreButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          style: const ButtonStyle(
            padding:
                MaterialStatePropertyAll(EdgeInsetsDirectional.only(end: 15)),
          ),
          onPressed: () {},
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'See more',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SizedBox(width: 5.0),
              Icon(Icons.arrow_forward_sharp, size: 22.0)
            ],
          ),
        ),
      ],
    );
  }
}
