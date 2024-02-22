import 'package:e_commerce/core/configs/styles/app_colors.dart';
import 'package:e_commerce/features/home/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CatogeryTitleItem extends StatelessWidget {
  const CatogeryTitleItem({
    super.key,
    required this.isSelected,
    required this.txt,
    required this.number,
  });
  final bool isSelected;
  final String txt;
  final int number;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeViewModel>(context);

    return TextButton(
      onPressed: () {
        provider.setCategory(number);
      },
      style:
          const ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.zero)),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isSelected ? AppColors.mainColor : Colors.transparent,
              width: 4,
            ),
          ),
        ),
        child: Text(
          txt,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 19.5,
                color: isSelected ? AppColors.mainColor : Colors.grey[600],
              ),
        ),
      ),
    );
  }
}

class CatogeryTitleItemsList extends StatelessWidget {
  const CatogeryTitleItemsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeViewModel>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CatogeryTitleItem(
            isSelected: provider.currentCategory == 0,
            txt: 'Electrionic',
            number: 0,
          ),
          const Spacer(),
          CatogeryTitleItem(
            isSelected: provider.currentCategory == 1,
            txt: 'Clothes',
            number: 1,
          ),
          const Spacer(),
          CatogeryTitleItem(
            isSelected: provider.currentCategory == 2,
            txt: 'Sports',
            number: 2,
          ),
          const Spacer(),
          CatogeryTitleItem(
            isSelected: provider.currentCategory == 3,
            txt: 'Corona',
            number: 3,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
