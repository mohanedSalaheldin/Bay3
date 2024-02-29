import 'package:e_commerce/app.dart';
import 'package:e_commerce/core/utils/helpers/cache_helper/cache_helper.dart';
import 'package:e_commerce/features/auth/view_model/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
 
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  WidgetsFlutterBinding.ensureInitialized();
  USER_TOKEN_VALUE = await CacheHelperImpl().getData(USER_TOKEN_KEY) ?? '';
  runApp(
    const MyApp(),
  );
}
