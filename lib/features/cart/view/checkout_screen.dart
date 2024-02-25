import 'package:e_commerce/core/configs/routes/routes_name.dart';
import 'package:e_commerce/core/configs/styles/app_colors.dart';
import 'package:e_commerce/core/configs/styles/frequently_used_texts.dart';
import 'package:e_commerce/core/utils/shared/components/screens/offline_error_screen.dart';
import 'package:e_commerce/core/utils/shared/components/screens/server_error_screen.dart';
import 'package:e_commerce/core/utils/shared/components/widgets/default_button.dart';
import 'package:e_commerce/core/utils/shared/components/widgets/default_text_buttin.dart';
import 'package:e_commerce/core/utils/shared/components/widgets/loading_screen.dart';
import 'package:e_commerce/core/utils/shared/components/widgets/snack_bars.dart';
import 'package:e_commerce/core/utils/shared/models/user_data_model.dart';
import 'package:e_commerce/core/utils/shared/screen_sizes/screen_sizes.dart';
import 'package:e_commerce/features/addresses/model/address_model.dart';
import 'package:e_commerce/features/addresses/view_model/addresses_view_model.dart';
import 'package:e_commerce/features/cart/view/widgets/card_title_with_action.dart';
import 'package:e_commerce/features/cart/view/widgets/payment_bottom_sheet.dart';
import 'package:e_commerce/features/cart/view/widgets/payment_methods_card.dart';
import 'package:e_commerce/features/cart/view/widgets/shopping_info_card.dart';
import 'package:e_commerce/features/cart/view_model/cart_view_model.dart';
import 'package:e_commerce/features/profile/view_model/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = ScreenSizes.getHeight(context);
    var provider = Provider.of<AddressesViewModel>(context);

    //  List<AddressModel> addresses = provider.addresses;

    if (provider.addressesStates == AddressesStates.loading) {
      return const LoadingScreen();
    } else if (provider.addressesStates == AddressesStates.serverError) {
      return const ServerErrorScreen();
    } else if (provider.addressesStates == AddressesStates.connectionError) {
      return const OfflineErrorScreen();
    }
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
              actionWidget: DefaultTextButton(
                  txt: 'Change',
                  onpressed: () {
                    Provider.of<ProfileViewModel>(context, listen: false)
                        .getProfileData();
                    Provider.of<AddressesViewModel>(context, listen: false)
                        .getAddresses();
                    Navigator.pushNamed(context, RoutesName.profile);
                  }),
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
