import 'package:e_commerce/core/configs/themes/app_theme.dart';
import 'package:e_commerce/core/configs/routes/routes.dart';
import 'package:e_commerce/core/configs/routes/routes_name.dart';
// import 'package:e_commerce/view/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getAppTheme(),
      title: 'E-commerce',
      onGenerateRoute: Routes.generateRoute,
      initialRoute: RoutesName.login,
      // home: const OnboardingScreen(),
    );
  }
}
