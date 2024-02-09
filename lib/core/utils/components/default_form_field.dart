import 'package:e_commerce/core/configs/styles/app_colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DefaultTextFormField extends StatelessWidget {
  final BuildContext context;
  final String txt;
  final String iconPath;
  final TextEditingController controller;
  bool? isPassword;
  bool? isPasswordShown;
  final TextInputType? keyboard;
  final String? Function(String?) validator;
  final void Function()? onSuffexPressed;

  DefaultTextFormField({
    super.key,
    required this.context,
    required this.txt,
    required this.iconPath,
    required this.controller,
    this.isPassword = false,
    this.isPasswordShown,
    this.keyboard = TextInputType.name,
    required this.validator,
    this.onSuffexPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 20.0,
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage(
                  iconPath,
                ),
              ),
            ),
            const SizedBox(width: 10.0),
            Text(txt,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      height: 0,
                      color: const Color.fromARGB(255, 24, 24, 24),
                    )),
          ],
        ),
        TextFormField(
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 18),
          validator: validator,
          obscureText: isPasswordShown ?? false,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(0),
            suffixIcon: isPassword!
                ? TextButton(
                    onPressed: onSuffexPressed,
                    child: const Text(
                      'Show',
                      style: TextStyle(
                        color: AppColors.mainColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : null,
          ),
          controller: controller,
          keyboardType: keyboard,
        ),
      ],
    );
  }
}
