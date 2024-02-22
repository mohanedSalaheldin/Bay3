import 'package:e_commerce/core/utils/shared/components/widgets/customized_texts.dart';
import 'package:e_commerce/core/utils/shared/components/widgets/default_button.dart';
import 'package:e_commerce/core/utils/shared/constants/assets_pathes.dart';
import 'package:e_commerce/core/configs/styles/app_colors.dart';

import 'package:e_commerce/core/configs/routes/routes_name.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(vertical: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(
                width: double.infinity,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customizedExtraBoldText('Find your', context),
                  customizedExtraBoldText('Gadget', context),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              const SizedBox(
                height: 380,
                child: Image(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    AssetsPathes.onboardingImage,
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              ConfirmButton(
                txt: 'Get started',
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(RoutesName.login);
                },
                backgoungColor: Colors.white,
                textColor: AppColors.mainColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
