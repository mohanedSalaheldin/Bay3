// ignore_for_file: unused_local_variable

import 'package:e_commerce/core/utils/shared/models/user_data_model.dart';
import 'package:e_commerce/features/addresses/model/address_model.dart';
import 'package:e_commerce/features/addresses/view_model/addresses_view_model.dart';
import 'package:e_commerce/features/profile/view_model/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShoppingInformationCard extends StatelessWidget {
  const ShoppingInformationCard({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    var addressedProvider =
        Provider.of<AddressesViewModel>(context, listen: false);
    List<AddressModel> addresses = addressedProvider.addresses;
       UserDataModel userDataModel =
        Provider.of<ProfileViewModel>(context, listen: false).userdata;
    return Container(
      height: height / 4.4,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25.0,
          vertical: 10.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
             ShoppingInfoItem(
              icon: Icons.person_4_outlined,
              txt:userDataModel.name,
            ),
            ShoppingInfoItem(
              icon: Icons.location_on_outlined,
              txt: addresses.isEmpty
                  ? 'Address: No address added yet'
                  : 'Address: ${addresses.first.region}, ${addresses.first.city}, ${addresses.first.details}',
            ),
             ShoppingInfoItem(
              icon: Icons.phone_outlined,
              txt: userDataModel.phone,
            ),
          ],
        ),
      ),
    );
  }
}

class ShoppingInfoItem extends StatelessWidget {
  const ShoppingInfoItem({
    super.key,
    required this.icon,
    required this.txt,
  });
  final IconData icon;
  final String txt;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 35.0),
        const SizedBox(width: 10.0),
        SizedBox(
          width: 200,
          child: Text(
            txt,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
      ],
    );
  }
}
