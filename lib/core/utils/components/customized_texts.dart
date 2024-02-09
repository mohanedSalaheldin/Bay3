import 'package:flutter/material.dart';

Text customizedExtraBoldText(String txt, context) {
  return Text(
    txt,
    textAlign: TextAlign.start,
    style: Theme.of(context).textTheme.displayLarge,
  );
}