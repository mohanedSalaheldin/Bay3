import 'package:device_preview/device_preview.dart';
import 'package:e_commerce/app.dart';
import 'package:e_commerce/core/utils/helpers/cache_helper/cache_helper.dart';
import 'package:e_commerce/features/auth/view_model/login_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  USER_TOKEN_VALUE = await CacheHelperImpl().getData(USER_TOKEN_KEY) ?? '';
  // runApp(
  //   DevicePreview(
  //     enabled: !kReleaseMode,
  //     builder: (context) => const MyApp(), // Wrap your app
  //   ),
  // );
  runApp(
    const MyApp(),
  );
}
