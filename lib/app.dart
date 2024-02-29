import 'package:e_commerce/core/configs/themes/app_theme.dart';
import 'package:e_commerce/core/configs/routes/routes.dart';
import 'package:e_commerce/core/configs/routes/routes_name.dart';
import 'package:e_commerce/features/auth/view_model/login_view_model.dart';
import 'package:e_commerce/features/cart/view_model/cart_view_model.dart';
import 'package:e_commerce/features/favorites/view_model/favorites_view_model.dart';
import 'package:e_commerce/features/home/view_model/home_view_model.dart';
import 'package:e_commerce/features/layout/view_model/layout_veiw_model.dart';
import 'package:e_commerce/features/product/view_model/product_view_model.dart';
import 'package:e_commerce/features/addresses/view_model/addresses_view_model.dart';
import 'package:e_commerce/features/orders/view_model/orders_view_model.dart';
import 'package:e_commerce/features/profile/view_model/profile_view_model.dart';
import 'package:e_commerce/features/search/view_model/search_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Future.delayed(const Duration(milliseconds: 500), () {
      FlutterNativeSplash.remove();
    // });
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LayoutViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeViewModel()
            ..fetchElectroncsProducts()
            ..fetchClothesProducts()
            ..fetchSportsProducts()
            ..fetchCoronaProducts(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => FavoritesViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => SearchViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProfileViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => AddressesViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => OrdersViewModel(),
        ),
      ],
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: getAppTheme(),
        title: 'E-commerce',
        onGenerateRoute: Routes.generateRoute,
        initialRoute: _chooseStartScreen(),
        // home: const OfflineErrorScreen(),
        // home: const NoHistoryScreen(),
      ),
    );
  }

  String _chooseStartScreen() {
    return USER_TOKEN_VALUE == '' ? RoutesName.login : RoutesName.layout;
  }
}
