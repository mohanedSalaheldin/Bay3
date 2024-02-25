import 'package:e_commerce/core/configs/styles/app_colors.dart';
import 'package:e_commerce/core/utils/shared/components/screens/offline_error_screen.dart';
import 'package:e_commerce/core/utils/shared/components/screens/server_error_screen.dart';
import 'package:e_commerce/core/utils/shared/components/widgets/default_button.dart';
import 'package:e_commerce/core/utils/shared/components/widgets/default_form_field.dart';
import 'package:e_commerce/core/utils/shared/components/widgets/loading_screen.dart';
import 'package:e_commerce/core/utils/shared/constants/assets_pathes.dart';
import 'package:e_commerce/core/utils/shared/screen_sizes/screen_sizes.dart';
import 'package:e_commerce/features/addresses/model/address_model.dart';
import 'package:e_commerce/features/addresses/view/widgets/add_address_bottom_sheet.dart';
import 'package:e_commerce/features/addresses/view/widgets/address_item.dart';
import 'package:e_commerce/features/addresses/view_model/addresses_view_model.dart';
import 'package:e_commerce/features/profile/view_model/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShoppingAddressesScreen extends StatelessWidget {
  const ShoppingAddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AddressesViewModel>(context);
    List<AddressModel> addresses = provider.addresses;

    if (provider.addressesStates == AddressesStates.loading) {
      return const LoadingScreen();
    } else if (provider.addressesStates == AddressesStates.serverError) {
      return const ServerErrorScreen();
    } else if (provider.addressesStates == AddressesStates.connectionError) {
      return const OfflineErrorScreen();
    }
    var height = ScreenSizes.getHeight(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Addresses'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => AddAddressBottomSheet(),
          );
        },
        backgroundColor: AppColors.mainColor,
        isExtended: true,
        child: const Icon(
          Icons.add_location_alt_outlined,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => AddressItem(
                  index: index.toString(),
                  addressModel: addresses[index],
                ),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 15),
                itemCount: addresses.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
