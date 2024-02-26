import 'package:flutter/material.dart';

class LayoutViewModel extends ChangeNotifier {
  final int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  final String about =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
  final String terms =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
  List<String> questions = [
  "What payment methods are accepted?",
  "Is there a return policy?",
  "Are there any discounts or promotions available?",
  "How can I track my order?",
  "Is my personal information secure?",
  "Can I change or cancel my order after it's been placed?"
];

List<String> answers = [
  "We accept various payment methods including credit/debit cards, mobile wallets, and digital currencies.",
  "Yes, we have a return policy. Please refer to our Returns and Refunds section for more details.",
  "Yes, we regularly offer discounts and promotions. Check our Promotions section for current offers.",
  "You can track your order by logging into your account and accessing the Order History section. Alternatively, you will receive tracking information via email or SMS.",
  "Yes, we take the security of your personal information seriously. We use encryption and other security measures to protect your data.",
  "Please contact our customer support as soon as possible if you need to change or cancel your order. We'll do our best to accommodate your request, but it may depend on the status of your order."
];


}
