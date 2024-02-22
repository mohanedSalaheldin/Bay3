import 'package:e_commerce/core/configs/routes/routes_name.dart';
import 'package:e_commerce/core/configs/styles/app_colors.dart';
import 'package:e_commerce/core/configs/styles/frequently_used_texts.dart';
import 'package:e_commerce/core/utils/shared/components/screens/offline_error_screen.dart';
import 'package:e_commerce/core/utils/shared/components/screens/server_error_screen.dart';
import 'package:e_commerce/core/utils/shared/components/widgets/default_button.dart';
import 'package:e_commerce/core/utils/shared/components/widgets/loading_screen.dart';
import 'package:e_commerce/features/cart/view/widgets/card_title_with_action.dart';
import 'package:e_commerce/features/cart/view/widgets/cart_product_item.dart';
import 'package:e_commerce/features/cart/view_model/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CartViewModel>(context);
    if (provider.cartStates == CartStates.loading) {
      return const LoadingScreen();
    } else if (provider.cartStates == CartStates.serverError) {
      return const ServerErrorScreen();
    } else if (provider.cartStates == CartStates.connectionError) {
      return const OfflineErrorScreen();
    }
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 50.0,
              decoration: BoxDecoration(
                color: HexColor('#d4f1ff'),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.notifications_none),
                    SizedBox(width: 5.0),
                    Expanded(
                      child: Text(
                        'Delivery for FREE until the last end of the month',
                        maxLines: 1,
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 11,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15.0),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => CartPruductItem(
                    index: index.toString(),
                    productModel: provider.cartsProducts[index]),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 15),
                itemCount: provider.cartsProducts.length,
              ),
            ),
            CardTitleWithAction(
              title: 'Total',
              actionWidget: PriceText(
                price: provider.total.toString(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: ConfirmButton(
                txt: 'Checkout',
                backgoungColor: AppColors.mainColor,
                onPressed: () {
                  Navigator.pushNamed(context, RoutesName.checkout);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
