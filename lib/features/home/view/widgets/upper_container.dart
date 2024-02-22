import 'package:flutter/material.dart';

class UpperContainer extends StatelessWidget {
  const UpperContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TopContairText(txt: 'Order Online'),
        TopContairText(txt: 'collect in store'),
      ],
    );
  }
}

class TopContairText extends StatelessWidget {
  const TopContairText({
    super.key,
    required this.txt,
  });
  final String txt;

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 35,
        height: 1.3,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}