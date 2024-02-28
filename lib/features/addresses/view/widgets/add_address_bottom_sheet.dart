import 'package:e_commerce/core/utils/shared/components/widgets/default_button.dart';
import 'package:e_commerce/core/utils/shared/screen_sizes/screen_sizes.dart';
import 'package:e_commerce/features/addresses/model/address_model.dart';
import 'package:e_commerce/features/addresses/view_model/addresses_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddAddressBottomSheet extends StatefulWidget {
  const AddAddressBottomSheet({super.key});

  @override
  State<AddAddressBottomSheet> createState() => _AddAddressBottomSheetState();
}

class _AddAddressBottomSheetState extends State<AddAddressBottomSheet> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController regionController = TextEditingController();

  final TextEditingController cityController = TextEditingController();

  final TextEditingController detailsController = TextEditingController();

  final TextEditingController noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = ScreenSizes.getHeight(context);
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      height: height * .65,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildTextFormFieldForAddressBottomSheet(
              context: context,
              controller: nameController,
              label: 'Name',
              validator: (value) {
                if (value!.isEmpty || value == '') {
                  return "can't be empty";
                }
                return null;
              },
            ),
            _buildTextFormFieldForAddressBottomSheet(
              context: context,
              controller: regionController,
              label: 'Region',
              validator: (value) {
                if (value!.isEmpty || value == '') {
                  return "can't be empty";
                }
                return null;
              },
            ),
            _buildTextFormFieldForAddressBottomSheet(
              context: context,
              controller: cityController,
              label: 'City',
              validator: (value) {
                if (value!.isEmpty || value == '') {
                  return "can't be empty";
                }
                return null;
              },
            ),
            _buildTextFormFieldForAddressBottomSheet(
              context: context,
              controller: detailsController,
              label: 'Details',
              validator: (value) {
                if (value!.isEmpty || value == '') {
                  return "can't be empty";
                }
                return null;
              },
            ),
            _buildTextFormFieldForAddressBottomSheet(
              context: context,
              controller: noteController,
              label: 'Note',
              validator: (value) {
                if (value!.isEmpty || value == '') {
                  return "can't be empty";
                }
                return null;
              },
            ),
            ConfirmButton(
              onPressed: () {
                AddressModel model = AddressModel(
                    id: 0,
                    name: nameController.text,
                    city: cityController.text,
                    region: regionController.text,
                    details: detailsController.text,
                    notes: noteController.text,
                    latitude: 30.0616863,
                    longitude: 30.0616863);
                Provider.of<AddressesViewModel>(context, listen: false)
                    .addAddress(model: model);
                Navigator.pop(context);
              },
              txt: 'Save',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFormFieldForAddressBottomSheet({
    required BuildContext context,
    required TextEditingController controller,
    required String? Function(String?) validator,
    required String label,
  }) {
    var width = ScreenSizes.getWidth(context);
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          SizedBox(
            width: width - 60,
            child: TextFormField(
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 18),
              validator: validator,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(0),
                label: Text(label),
              ),
              controller: controller,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    regionController.dispose();
    cityController.dispose();
    detailsController.dispose();
    noteController.dispose();
    super.dispose();
  }
}
