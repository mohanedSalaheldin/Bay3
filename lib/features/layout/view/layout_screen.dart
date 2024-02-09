import 'package:e_commerce/core/configs/cache_helper/cache_helper.dart';
import 'package:e_commerce/features/auth/view_model/login_view_model.dart';
import 'package:flutter/material.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(onPressed: () {
        CacheHelperImpl().getData(USER_TOKEN_KEY);
      }),
      body: const Column(children: [Text('HOME LAYOUT')]),
    );
  }
}
