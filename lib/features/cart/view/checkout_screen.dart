import 'package:e_commerce/core/utils/shared/components/widgets/snack_bars.dart';
import 'package:e_commerce/features/cart/view/widgets/checkout_body.dart';
import 'package:e_commerce/features/cart/view_model/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
  
    var cartProvider = Provider.of<CartViewModel>(context);
    if (cartProvider.cartStates == CartStates.payDone) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showErrorSnackBar(context, 'Order have been Confermed', isError: false);
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: buildCheckoutBody(context),
    );
  }
}
