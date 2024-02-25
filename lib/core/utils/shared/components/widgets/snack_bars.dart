import 'package:flutter/material.dart';

showErrorSnackBar(
  BuildContext context,
  String txt, {
  bool isError = true,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        txt,
        style: const TextStyle(
            fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500),
      ),
      backgroundColor: isError ? Colors.redAccent : Colors.green,
    ),
  );
}
