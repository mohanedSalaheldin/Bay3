import 'package:e_commerce/core/configs/styles/app_colors.dart';
import 'package:flutter/material.dart';

class DefaultTextButton extends StatelessWidget {
  final String txt;
  final void Function()? onpressed;
  const DefaultTextButton({
    super.key,
    required this.txt,
    this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onpressed,
      style:
          const ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.zero)),
      child: Text(
        txt,
        style: const TextStyle(
          color: AppColors.mainColor,
          fontSize: 17.0,
        ),
      ),
    );
  }
}