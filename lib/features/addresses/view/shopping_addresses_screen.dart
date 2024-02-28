import 'package:e_commerce/core/configs/styles/app_colors.dart';
import 'package:e_commerce/features/addresses/view/widgets/add_address_bottom_sheet.dart';
import 'package:e_commerce/features/addresses/view/widgets/addresses_body.dart';
import 'package:flutter/material.dart';

class ShoppingAddressesScreen extends StatelessWidget {
  const ShoppingAddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Addresses'),
      ),
      floatingActionButton: _buildFlaotiongAction(context),
      body: buildAddressesBody(context),
    );
  }

  FloatingActionButton _buildFlaotiongAction(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => const AddAddressBottomSheet(),
        );
      },
      backgroundColor: AppColors.mainColor,
      isExtended: true,
      child: const Icon(
        Icons.add_location_alt_outlined,
        color: Colors.white,
      ),
    );
  }
}
