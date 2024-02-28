import 'package:e_commerce/core/configs/routes/routes_name.dart';
import 'package:e_commerce/core/utils/shared/components/screens/offline_error_screen.dart';
import 'package:e_commerce/core/utils/shared/components/screens/server_error_screen.dart';
import 'package:e_commerce/core/utils/shared/components/widgets/loading_screen.dart';
import 'package:e_commerce/features/addresses/model/address_model.dart';
import 'package:e_commerce/features/addresses/view/widgets/address_item.dart';
import 'package:e_commerce/features/addresses/view_model/addresses_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Padding buildAddressesBody(BuildContext context) {
  var provider = Provider.of<AddressesViewModel>(context);
  List<AddressModel> addresses = provider.addresses;
  if (provider.addressesStates == AddressesStates.loading) {
    const LoadingScreen();
  } else if (provider.addressesStates == AddressesStates.serverError) {
    const ServerErrorScreen();
  } else if (provider.addressesStates == AddressesStates.connectionError) {
    const OfflineErrorScreen(
      currentScreenPath: RoutesName.addresses,
    );
  }
 
  return Padding(
    padding: const EdgeInsets.all(30.0),
    child: Column(
      children: [
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) => AddressItem(
              index: index.toString(),
              addressModel: addresses[index],
            ),
            separatorBuilder: (context, index) => const SizedBox(height: 15),
            itemCount: addresses.length,
          ),
        ),
      ],
    ),
  );
}
