import 'package:date_format/date_format.dart';
import 'package:e_commerce/core/configs/styles/frequently_used_texts.dart';
import 'package:e_commerce/core/utils/shared/components/widgets/default_button.dart';
import 'package:e_commerce/core/utils/shared/constants/assets_pathes.dart';
import 'package:e_commerce/core/utils/shared/models/user_data_model.dart';
import 'package:e_commerce/core/utils/shared/screen_sizes/screen_sizes.dart';
import 'package:e_commerce/features/addresses/view_model/addresses_view_model.dart';
import 'package:e_commerce/features/cart/view/widgets/card_title_with_action.dart';
import 'package:e_commerce/features/cart/view_model/cart_view_model.dart';
import 'package:e_commerce/features/profile/view_model/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

class PaymentBottomSheetBuilder extends StatelessWidget {
  const PaymentBottomSheetBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CartViewModel>(context, listen: false);
    UserDataModel userDataModel =
        Provider.of<ProfileViewModel>(context, listen: false).userdata;

    var height = ScreenSizes.getHeight(context);
    int productsTatal = provider.cartsProducts.length;

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      height: height / 1.8,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(
          30.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Payment Method',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: 'Products: ',
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                      TextSpan(
                        text: productsTatal.toString(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: height / 4,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
                border: Border.all(width: .2),
                color: HexColor('#e7e9f3'),
              ),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'My credit card',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Image.asset(AssetsPathes.masterCardIcon),
                      ],
                    ),
                    Text(
                      '*** *** *** 1234',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          userDataModel.name,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          formatDate(DateTime.now(), [d, '.', M]),
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            CardTitleWithAction(
              title: 'Total',
              actionWidget: PriceText(
                price: provider.total.toString(),
              ),
            ),
            ConfirmButton(
              txt: 'Pay now',
              onPressed: () {
// ,,
                provider.confirmPayment(
                  addressID:
                      Provider.of<AddressesViewModel>(context, listen: false)
                          .addresses
                          .first
                          .id,
                );
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
