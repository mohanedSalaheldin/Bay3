import 'package:e_commerce/features/cart/view/widgets/cart_body.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basket'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.delete_outlined,
              color: Colors.red,
              size: 30.0,
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton:
      body: buildCartBody( context),
    );
  }

 
}
