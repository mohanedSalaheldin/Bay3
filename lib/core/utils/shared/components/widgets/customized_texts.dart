import 'package:flutter/material.dart';

Text customizedExtraBoldText(String txt, context, {Color? color}) {
  return Text(
    txt,
    textAlign: TextAlign.start,
    style: Theme.of(context).textTheme.displayLarge!.copyWith(
      color: color,
    ),
  );
}