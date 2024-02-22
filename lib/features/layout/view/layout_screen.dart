import 'package:e_commerce/core/configs/routes/routes_name.dart';
import 'package:e_commerce/core/utils/helpers/cache_helper/cache_helper.dart';
import 'package:e_commerce/core/utils/shared/constants/assets_pathes.dart';
import 'package:e_commerce/features/auth/view_model/login_view_model.dart';
import 'package:e_commerce/features/cart/view_model/cart_view_model.dart';
import 'package:e_commerce/features/favorites/view_model/favorites_view_model.dart';
import 'package:e_commerce/features/home/view/home_screen.dart';
import 'package:e_commerce/features/layout/view/widgets/layout_botton_nav.dart';
import 'package:e_commerce/features/layout/view/widgets/layout_screen_appbar.dart';
import 'package:e_commerce/features/layout/view_model/layout_veiw_model.dart';
import 'package:e_commerce/features/profile/view_model/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:provider/provider.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key, required this.controller});
  final ZoomDrawerController controller;

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> items = [
      buildBottonNavItem(
        iconPath: AssetsPathes.homeIcon,
        activeIconPath: AssetsPathes.homeFilledIcon,
      ),
      buildBottonNavItem(
        iconPath: AssetsPathes.heartIcon,
        activeIconPath: AssetsPathes.heartFilledIcon,
      ),
      buildBottonNavItem(
        iconPath: AssetsPathes.userIcon,
        activeIconPath: AssetsPathes.userFilledIcon,
      ),
      buildBottonNavItem(
        iconPath: AssetsPathes.cartIcon,
        activeIconPath: AssetsPathes.cartFilledIcon,
      ),
    ];

    return Consumer<LayoutViewModel>(
      builder: (context, provider, child) => Scaffold(
        appBar: buildLayoutAppBar(context, controller),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {

        //   },
        // ),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: items,
          currentIndex: provider.currentIndex,
          onTap: (value) {
            switch (value) {
              case 1:
                Provider.of<FavoritesViewModel>(context, listen: false)
                    .getFavorites();

                Navigator.pushNamed(context, RoutesName.favorites);
                break;
              case 2:
                Provider.of<ProfileViewModel>(context, listen: false)
                  ..getAddresses()
                  ..getProfileData();
                Navigator.pushNamed(context, RoutesName.profile);
                break;
              case 3:
                Provider.of<CartViewModel>(context, listen: false).getCarts();
                Navigator.pushNamed(context, RoutesName.cart);
                break;
              default:
            }
          },
        ),
        body: const HomeScreen(),
      ),
    );
  }
}
