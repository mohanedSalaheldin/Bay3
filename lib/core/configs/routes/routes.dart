import 'package:e_commerce/core/configs/routes/routes_name.dart';
import 'package:e_commerce/features/auth/view/login/login_screen.dart';
import 'package:e_commerce/features/layout/view/layout_screen.dart';
import 'package:e_commerce/features/onboarding/onboarding_screen.dart';
import 'package:e_commerce/features/auth/view/register/register_screen.dart';
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
            builder: (BuildContext context) => const LayoutScreen());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(child: Text('No route defined')),
          );
        });
    }
  }
}
