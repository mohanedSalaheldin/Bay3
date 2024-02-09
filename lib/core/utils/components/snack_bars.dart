import 'package:flutter/material.dart';

showErrorSnackBar(
  BuildContext context,
  String txt,
) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        txt,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.redAccent,
    ),
  );
}