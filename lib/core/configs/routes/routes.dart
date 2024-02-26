import 'package:e_commerce/core/configs/routes/routes_name.dart';
import 'package:e_commerce/features/auth/view/login/login_screen.dart';
import 'package:e_commerce/features/cart/view/cart_screen.dart';
import 'package:e_commerce/features/cart/view/checkout_screen.dart';
import 'package:e_commerce/features/favorites/view/favorites_screen.dart';
import 'package:e_commerce/features/layout/view/addtion_screens/about_screen.dart';
import 'package:e_commerce/features/layout/view/addtion_screens/q_and_a_screen.dart';
import 'package:e_commerce/features/layout/view/addtion_screens/terms_screen.dart';
import 'package:e_commerce/features/layout/view/drower_layout_screen.dart';
import 'package:e_commerce/features/onboarding/onboarding_screen.dart';
import 'package:e_commerce/features/auth/view/register/register_screen.dart';
import 'package:e_commerce/features/profile/view/profile_screen.dart';
import 'package:e_commerce/features/orders/view/orders_history_screen.dart';
import 'package:e_commerce/features/addresses/view/shopping_addresses_screen.dart';
import 'package:e_commerce/features/profile/view/screens/edit_profile_screen.dart';
import 'package:e_commerce/features/search/view/search_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.onboard:
        return MaterialPageRoute(
            builder: (BuildContext context) => const OnboardingScreen());
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => LoginScreen());
      case RoutesName.register:
        return MaterialPageRoute(
            builder: (BuildContext context) => RegisterScreen());
      case RoutesName.layout:
        return MaterialPageRoute(
            builder: (BuildContext context) => DorwerLayoutScreen());
      case RoutesName.cart:
        return MaterialPageRoute(
            builder: (BuildContext context) => const CartScreen());
      case RoutesName.profile:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ProfileScreen());
      case RoutesName.favorites:
        return MaterialPageRoute(
            builder: (BuildContext context) => const FavoritesScreen());
      case RoutesName.search:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SearchScreen());
      case RoutesName.checkout:
        return MaterialPageRoute(
            builder: (BuildContext context) => const CheckoutScreen());
      case RoutesName.orders:
        return MaterialPageRoute(
            builder: (BuildContext context) => const OrdersHistoryScreen());
      case RoutesName.addresses:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ShoppingAddressesScreen());
      case RoutesName.editProfile:
        return MaterialPageRoute(
            builder: (BuildContext context) => const EditProfileScreen());
      case RoutesName.fAQs:
        return MaterialPageRoute(
            builder: (BuildContext context) => const QaAScreen());
      case RoutesName.about:
        return MaterialPageRoute(
            builder: (BuildContext context) => const AboutScreen());
      case RoutesName.terms:
        return MaterialPageRoute(
            builder: (BuildContext context) => const TermsScreen());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(child: Text('No route defined')),
          );
        });
    }
  }
}
