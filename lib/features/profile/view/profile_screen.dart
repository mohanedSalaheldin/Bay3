import 'package:date_format/date_format.dart';
import 'package:e_commerce/core/configs/routes/routes_name.dart';
import 'package:e_commerce/core/utils/shared/components/screens/offline_error_screen.dart';
import 'package:e_commerce/core/utils/shared/components/screens/server_error_screen.dart';
import 'package:e_commerce/core/utils/shared/components/widgets/loading_screen.dart';
import 'package:e_commerce/core/utils/shared/models/user_data_model.dart';
import 'package:e_commerce/core/utils/shared/screen_sizes/screen_sizes.dart';
import 'package:e_commerce/features/auth/view_model/login_view_model.dart';
import 'package:e_commerce/features/profile/view/widgets/profile_settings_item.dart';
import 'package:e_commerce/features/profile/view/widgets/user_data_cart.dart';
import 'package:e_commerce/features/profile/view_model/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = ScreenSizes.getHeight(context);
     var provider = Provider.of<ProfileViewModel>(context);
    if (provider.profileStates == ProfileStates.loading) {
      return const LoadingScreen();
    } else if (provider.profileStates == ProfileStates.serverError) {
      return const ServerErrorScreen();
    } else if (provider.profileStates == ProfileStates.connectionError) {
      return const OfflineErrorScreen();
    }
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.temple_buddhist_outlined),
        onPressed: () {
          Provider.of<ProfileViewModel>(context, listen: false).getAddresses();

        },
      ),
      appBar: AppBar(
        title: const Text('My Profile'),
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.only(
          start: 30.0,
          end: 30.0,
          // top: 15.0,
          bottom: 30.0,
        ),
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
                      Navigator.pushNamed(context, RoutesName.orders);
                    },
                  ),
                  ProfileSettingsOptionItem(
                    title: 'Logout',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
