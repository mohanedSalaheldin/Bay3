import 'package:e_commerce/core/configs/routes/routes_name.dart';
import 'package:e_commerce/core/utils/shared/components/screens/offline_error_screen.dart';
import 'package:e_commerce/core/utils/shared/components/screens/server_error_screen.dart';
import 'package:e_commerce/core/utils/shared/components/widgets/loading_screen.dart';
import 'package:e_commerce/core/utils/shared/screen_sizes/screen_sizes.dart';
import 'package:e_commerce/features/home/view/widgets/home_body.dart';
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
          return const OfflineErrorScreen(
            currentScreenPath: RoutesName.home,
          );
        }

        List<List> categoryTaps = [
          provider.electronicsProducts,
          provider.clothesProducts,
          provider.sportProducts,
          provider.coronaProducts,
        ];
        return Scaffold(
          body: buildHomeBody(height, categoryTaps, provider, width),
        );
      },
    );
  }
}
