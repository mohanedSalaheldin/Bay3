import 'package:e_commerce/core/utils/shared/screen_sizes/screen_sizes.dart';
import 'package:flutter/material.dart';

class ProfileSettingsOptionItem extends StatelessWidget {
  const ProfileSettingsOptionItem({
    super.key,
    required this.title,
    required this.onTap,
  });
  final String title;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    double height = ScreenSizes.getHeight(context);
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
        height: (height / 2.05) / 5,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                ),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
