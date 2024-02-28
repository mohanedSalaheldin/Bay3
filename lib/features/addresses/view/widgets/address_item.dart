import 'package:e_commerce/core/configs/styles/app_colors.dart';
import 'package:e_commerce/core/utils/shared/screen_sizes/screen_sizes.dart';
import 'package:e_commerce/features/addresses/model/address_model.dart';
import 'package:e_commerce/features/addresses/view_model/addresses_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class AddressItem extends StatelessWidget {
  const AddressItem({
    super.key,
    required this.index,
    required this.addressModel,
  });
  final String index;
  final AddressModel addressModel;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AddressesViewModel>(context);

    var height = ScreenSizes.getHeight(context);
    return Slidable(
      key: Key(index),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(
          onDismissed: () {
            provider.deleteAddress(index: int.parse(index));
          },
        ),
        children: [
          SlidableAction(
            onPressed: (context) {
              provider.deleteAddress(index: int.parse(index));
            },
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: Container(
        height: height * .15,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(
                Icons.location_pin,
                size: 40.0,
                color: AppColors.mainColor,
              ),
              SizedBox(
                width: 150,
                child: Text(
                  '${addressModel.region},${addressModel.city},${addressModel.details}',
                  maxLines: 2,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Text(
                addressModel.name,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
