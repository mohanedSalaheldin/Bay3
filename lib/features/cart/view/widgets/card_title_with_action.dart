
import 'package:flutter/material.dart';

class CardTitleWithAction extends StatelessWidget {
  const CardTitleWithAction({
    super.key,
    required this.title,
    required this.actionWidget,
  });
  final String title;
  final Widget actionWidget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          maxLines: 2,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
        ),
        actionWidget,
      ],
    );
  }
}
