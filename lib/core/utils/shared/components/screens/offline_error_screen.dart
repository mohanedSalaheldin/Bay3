import 'package:e_commerce/core/utils/shared/components/widgets/default_button.dart';
import 'package:e_commerce/core/utils/shared/constants/assets_pathes.dart';
import 'package:e_commerce/core/utils/shared/screen_sizes/screen_sizes.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class OfflineErrorScreen extends StatelessWidget {
  const OfflineErrorScreen({
    super.key,
    required this.currentScreenPath,
  });
  final String currentScreenPath;

  @override
  Widget build(BuildContext context) {
    double height = ScreenSizes.getHeight(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                color: Colors.white,
                child: Image(
                  height: height * .25,
                  width: height * .25,
                  fit: BoxFit.contain,
                  image: const AssetImage(AssetsPathes.noInternetIcon),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            const Text('No Internet Connection'),
            const SizedBox(height: 20.0),
            SizedBox(
              width: 300.0,
              height: 60,
              child: ConfirmButton(
                txt: 'txt',
                onPressed: () {},
                backgoungColor: HexColor('#59c0eb'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
