import 'package:e_commerce/core/configs/routes/routes_name.dart';
import 'package:e_commerce/core/configs/styles/app_colors.dart';
import 'package:e_commerce/core/utils/shared/screen_sizes/screen_sizes.dart';
import 'package:e_commerce/features/layout/view/layout_screen.dart';
import 'package:e_commerce/features/layout/view/widgets/drower_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class DorwerLayoutScreen extends StatelessWidget {
  DorwerLayoutScreen({super.key});

  final _drawerController = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ZoomDrawer(
        style: DrawerStyle.defaultStyle,
        controller: _drawerController,
        menuScreen: const MenuScreen(),
        mainScreen: LayoutScreen(
          controller: _drawerController,
        ),
        borderRadius: 50.0,
        showShadow: true,
        angle: 0.0,
        menuBackgroundColor: AppColors.mainColor,
        slideWidth: ScreenSizes.getWidth(context) * .6,
        openCurve: Curves.easeInOutCubicEmphasized,
        closeCurve: Curves.easeInOutCubicEmphasized,
      ),
    );
  }
}

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
              drowerItem('Profile', () {}),
              drowerDivider(context),
              drowerItem('My Oreders', () {}),
              drowerDivider(context),
              drowerItem('Favorites', () {}),
              drowerDivider(context),
              drowerItem('FAQs', () {}),
              drowerDivider(context),
              drowerItem('Terms', () {}),
              drowerDivider(context),
              drowerItem('About', () {}),
              const Spacer(),
              drowerItem('Sign out', () {
                Navigator.pushReplacementNamed(context, RoutesName.login);
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
