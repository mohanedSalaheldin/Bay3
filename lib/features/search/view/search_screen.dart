import 'package:e_commerce/core/configs/routes/routes_name.dart';
import 'package:e_commerce/core/utils/shared/components/screens/offline_error_screen.dart';
import 'package:e_commerce/core/utils/shared/components/screens/server_error_screen.dart';
import 'package:e_commerce/core/utils/shared/components/widgets/loading_screen.dart';
import 'package:e_commerce/features/search/view/widgets/search_body.dart';
import 'package:e_commerce/features/search/view_model/search_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SearchViewModel>(context);
    if (provider.searchStates == SearchStates.loading) {
      return const LoadingScreen();
    } else if (provider.searchStates == SearchStates.serverError) {
      return const ServerErrorScreen();
    } else if (provider.searchStates == SearchStates.connectionError) {
        return const OfflineErrorScreen(
            currentScreenPath: RoutesName.search,
          );
    }

    return const Scaffold(
      // backgroundColor: Colors.amber,
      body: SearchBody(),
    );
  }
}


