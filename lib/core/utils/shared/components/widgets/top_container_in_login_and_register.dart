import 'package:e_commerce/core/configs/styles/app_colors.dart';
import 'package:e_commerce/core/utils/shared/components/widgets/customized_texts.dart';
import 'package:e_commerce/core/utils/shared/constants/assets_pathes.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';


class TopContainer extends StatelessWidget {
  const TopContainer({
    super.key,
    required this.height,
    required this.width,
    this.isRegister = false,
  });

  final double height;
  final double width;
  final bool? isRegister;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height / 2.8,
      width: width,
      decoration: const BoxDecoration(
          color: AppColors.mainColor,
          image: DecorationImage(
              fit: BoxFit.fitWidth,
              image: AssetImage('${AssetsPathes.images}wallpaper.png'))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 50.0,
            ),
            child: SizedBox(
              width: width,
              height: (height / 2.8) - 50.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customizedExtraBoldText('Welcome', context),
                  isRegister!
                      ? customizedExtraBoldText('there', context)
                      : customizedExtraBoldText('back', context),
                ],
              ),
            ),
          ),
          const Spacer(),
          Container(
            width: width,
            height: 50.0,
            decoration: BoxDecoration(
              color: HexColor('#f5f4f9'),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: const SizedBox(),
          ),
        ],
      ),
    );
  }
}
