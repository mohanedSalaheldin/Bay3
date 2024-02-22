import 'package:e_commerce/core/utils/shared/constants/assets_pathes.dart';
import 'package:flutter/material.dart';

class PaymentMethodsCard extends StatelessWidget {
  const PaymentMethodsCard({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height / 3.6,
      // width: height / 2.05,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25.0,
          vertical: 10.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RadioMenuButton(
              value: '1',
              groupValue: '1',
              onChanged: (value) {},
              child: const PayMentMethod(imagePath: AssetsPathes.visaCardIcon),
            ),
            RadioMenuButton(
              value: '2',
              groupValue: '1',
              onChanged: (value) {},
              child:
                  const PayMentMethod(imagePath: AssetsPathes.masterCardIcon),
            ),
            RadioMenuButton(
              value: '3',
              groupValue: '1',
              onChanged: (value) {},
              child:
                  const PayMentMethod(imagePath: AssetsPathes.creditCardIcon),
            ),
          ],
        ),
      ),
    );
  }
}

class PayMentMethod extends StatelessWidget {
  const PayMentMethod({
    super.key,
    required this.imagePath,
  });
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(imagePath),
        const SizedBox(width: 10.0),
        Text(
          '*** *** *** 1234',
          maxLines: 2,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
        ),
      ],
    );
  }
}
