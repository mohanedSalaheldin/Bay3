import 'package:e_commerce/core/configs/styles/app_colors.dart';
import 'package:e_commerce/core/configs/styles/frequently_used_texts.dart';
import 'package:e_commerce/core/utils/shared/components/widgets/default_button.dart';
import 'package:e_commerce/core/utils/shared/components/widgets/default_text_buttin.dart';
import 'package:e_commerce/core/utils/shared/screen_sizes/screen_sizes.dart';
import 'package:e_commerce/features/cart/view/widgets/card_title_with_action.dart';
import 'package:e_commerce/features/cart/view/widgets/payment_bottom_sheet.dart';
import 'package:e_commerce/features/cart/view/widgets/payment_methods_card.dart';
import 'package:e_commerce/features/cart/view/widgets/shopping_info_card.dart';
import 'package:e_commerce/features/cart/view_model/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = ScreenSizes.getHeight(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 10.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardTitleWithAction(
              title: 'Shopping Information',
              actionWidget: DefaultTextButton(txt: 'Change', onpressed: () {}),
            ),
            ShoppingInformationCard(height: height),
            const Text(
              'Payment Method',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            PaymentMethodsCard(height: height),
            CardTitleWithAction(
              title: 'Total',
              actionWidget: PriceText(
                price: Provider.of<CartViewModel>(context, listen: false)
                    .total
                    .toString(),
              ),
            ),
            ConfirmButton(
              txt: 'Confirm and pay',
              backgoungColor: AppColors.mainColor,
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return const PaymentBottomSheetBuilder();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
