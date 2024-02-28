import 'package:e_commerce/core/configs/styles/app_colors.dart';
import 'package:e_commerce/core/utils/shared/screen_sizes/screen_sizes.dart';
import 'package:e_commerce/features/layout/view/widgets/layout_screen.dart';
import 'package:e_commerce/features/layout/view/widgets/drower_menu_screen.dart';
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
