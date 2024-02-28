import 'package:e_commerce/core/configs/routes/routes_name.dart';
import 'package:e_commerce/core/configs/styles/app_colors.dart';
import 'package:e_commerce/core/utils/shared/screen_sizes/screen_sizes.dart';
import 'package:e_commerce/features/addresses/view_model/addresses_view_model.dart';
import 'package:e_commerce/features/favorites/view_model/favorites_view_model.dart';
import 'package:e_commerce/features/layout/view/widgets/drower_list_item.dart';
import 'package:e_commerce/features/orders/view_model/orders_view_model.dart';
import 'package:e_commerce/features/profile/view/widgets/logout_dialog.dart';
import 'package:e_commerce/features/profile/view_model/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});
  @override
  Widget build(BuildContext context) {
    double width = ScreenSizes.getWidth(context);
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(width / 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: ScreenSizes.getHeight(context) / 12.0,
              ),
              drowerItem(
                  txt: 'Profile',
                  icon: Icons.person_outlined,
                  onPressed: () {
                    Provider.of<ProfileViewModel>(context, listen: false)
                        .getProfileData();
                    Provider.of<AddressesViewModel>(context, listen: false)
                        .getAddresses();
                    Navigator.pushNamed(context, RoutesName.profile);
                  }),
              drowerDivider(context),
              drowerItem(
                  txt: 'My Oreders',
                  icon: Icons.shopping_bag_outlined,
                  onPressed: () {
                    Provider.of<OrdersViewModel>(context, listen: false)
                        .getOrders();
                    Navigator.pushNamed(context, RoutesName.orders);
                  }),
              drowerDivider(context),
              drowerItem(
                  txt: 'Favorites',
                  icon: Icons.favorite_border,
                  onPressed: () {
                    Provider.of<FavoritesViewModel>(context, listen: false)
                        .getFavorites();
                    Navigator.pushNamed(context, RoutesName.favorites);
                  }),
              drowerDivider(context),
              drowerItem(
                  txt: 'FAQs',
                  icon: Icons.question_answer_outlined,
                  onPressed: () {
                    Navigator.pushNamed(context, RoutesName.fAQs);
                  }),
              drowerDivider(context),
              drowerItem(
                  txt: 'Terms',
                  icon: Icons.rule_folder_outlined,
                  onPressed: () {
                    Navigator.pushNamed(context, RoutesName.terms);
                  }),
              drowerDivider(context),
              drowerItem(
                  txt: 'About',
                  icon: Icons.info_outline,
                  onPressed: () {
                    Navigator.pushNamed(context, RoutesName.about);
                  }),
              const Spacer(),
              drowerItem(
                  txt: 'Logout',
                  icon: Icons.logout,
                  onPressed: () {
                    showLogoutDialog(context);
                  }),
              SizedBox(
                height: ScreenSizes.getHeight(context) / 12.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
