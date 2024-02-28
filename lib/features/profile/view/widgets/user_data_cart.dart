import 'package:e_commerce/features/addresses/model/address_model.dart';
import 'package:e_commerce/features/addresses/view_model/addresses_view_model.dart';
import 'package:e_commerce/features/profile/view_model/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserDataCard extends StatelessWidget {
  const UserDataCard({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    var addressesProvider = Provider.of<AddressesViewModel>(context);
    var profileProvider = Provider.of<ProfileViewModel>(context);
    
    // print(provider.addresses);
    List<AddressModel> addresses = addressesProvider.addresses;
    return SizedBox(
      height: ((height / 1.9) / 2),
      width: double.infinity,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: ((height / 2.2) / 2),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 50),
                  Text(
                    profileProvider.userdata.name,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w600, fontSize: 21, height: 1.0),
                  ),
                  const SizedBox(height: 5.0),
                  Container(
                    height: 70,
                    padding: const EdgeInsetsDirectional.only(
                        start: 15.0, end: 15.0, bottom: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.location_on_outlined, size: 35.0),
                        const SizedBox(width: 10.0),
                        SizedBox(
                          width: 240,
                          child: Text(
                            addresses.isEmpty
                                ? 'Address: No address added yet'
                                : 'Address: ${addresses.first.region}, ${addresses.first.city}, ${addresses.first.details}',
                            maxLines: 2,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Align(
            alignment: AlignmentDirectional.topCenter,
            child: CircleAvatar(
              radius: 40.0,
              // backgroundColor: HexColor('#e8a139'),
              backgroundColor: Colors.black,
              child: Icon(
                Icons.account_circle_outlined,
                color: Colors.white,
                size: 80.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
