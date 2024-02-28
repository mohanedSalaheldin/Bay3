import 'package:e_commerce/core/configs/routes/routes_name.dart';
import 'package:e_commerce/core/utils/shared/components/screens/offline_error_screen.dart';
import 'package:e_commerce/core/utils/shared/components/screens/server_error_screen.dart';
import 'package:e_commerce/core/utils/shared/components/widgets/loading_screen.dart';
import 'package:e_commerce/core/utils/shared/screen_sizes/screen_sizes.dart';
import 'package:e_commerce/features/orders/view_model/orders_view_model.dart';
import 'package:e_commerce/features/profile/view/widgets/logout_dialog.dart';
import 'package:e_commerce/features/profile/view/widgets/profile_settings_item.dart';
import 'package:e_commerce/features/profile/view/widgets/user_data_cart.dart';
import 'package:e_commerce/features/profile/view_model/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget buildProfileBody(BuildContext context) {
  var height = ScreenSizes.getHeight(context);
  var provider = Provider.of<ProfileViewModel>(context);
  if (provider.profileStates == ProfileStates.loading) {
    return const LoadingScreen();
  } else if (provider.profileStates == ProfileStates.serverError) {
    return const ServerErrorScreen();
  } else if (provider.profileStates == ProfileStates.connectionError) {
    return const OfflineErrorScreen(
      currentScreenPath: RoutesName.profile,
    );
  }
  return Padding(
    padding:
        const EdgeInsetsDirectional.only(start: 30.0, end: 30.0, bottom: 30.0),
    child: Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserDataCard(height: height),
              ProfileSettingsOptionItem(
                title: 'Edit Profile',
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.editProfile);
                },
              ),
              ProfileSettingsOptionItem(
                title: 'Shopping Addresses',
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.addresses);
                },
              ),
              ProfileSettingsOptionItem(
                title: 'Orders History',
                onTap: () {
                  Provider.of<OrdersViewModel>(context, listen: false)
                      .getOrders();
                  Navigator.pushNamed(context, RoutesName.orders);
                },
              ),
              ProfileSettingsOptionItem(
                title: 'Logout',
                onTap: () {
                  showLogoutDialog(context);
                },
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
