import 'package:e_commerce/core/configs/styles/app_colors.dart';
import 'package:e_commerce/features/home/view/widgets/catigory_items.dart';
import 'package:e_commerce/features/home/view/widgets/home_product_item.dart';
import 'package:e_commerce/features/home/view/widgets/upper_container.dart';
import 'package:e_commerce/features/home/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
  Padding buildHomeBody(double height, List<List<dynamic>> categoryTaps, HomeViewModel provider, double width) {
    return Padding(
          padding: const EdgeInsetsDirectional.only(start: 30),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 0.0),
              const UpperContainer(),
              const CatogeryTitleItemsList(),
              SizedBox(
                height: height / 2.5,
                child: categoryTaps[provider.currentCategory].isEmpty
                    ? const Center(
                        child: CircularProgressIndicator(
                            color: AppColors.mainColor),
                      )
                    : ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => HomeProductItem(
                          productModel: categoryTaps[provider.currentCategory]
                              [index],
                        ),
                        separatorBuilder: (context, index) =>
                            SizedBox(width: width / 12),
                        itemCount:
                            categoryTaps[provider.currentCategory].length,
                      ),
              ),
              const SizedBox(height: 0.0),
            ],
          ),
        );
  }