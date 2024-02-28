import 'package:e_commerce/core/configs/routes/routes_name.dart';
import 'package:e_commerce/core/utils/shared/components/methods/app_methods.dart';
import 'package:e_commerce/core/utils/shared/components/screens/offline_error_screen.dart';
import 'package:e_commerce/core/utils/shared/components/screens/server_error_screen.dart';
import 'package:e_commerce/core/utils/shared/components/widgets/default_button.dart';
import 'package:e_commerce/core/utils/shared/components/widgets/default_form_field.dart';
import 'package:e_commerce/core/utils/shared/components/widgets/loading_screen.dart';
import 'package:e_commerce/core/utils/shared/constants/assets_pathes.dart';
import 'package:e_commerce/features/profile/view_model/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProfileViewModel>(context);
    var nameController = TextEditingController();
    var emailController = TextEditingController();
    var phoneController = TextEditingController();
    nameController.text = provider.userdata.name;
    emailController.text = provider.userdata.email;
    phoneController.text = provider.userdata.phone;
    if (provider.profileStates == ProfileStates.loading) {
      return const LoadingScreen();
    } else if (provider.profileStates == ProfileStates.serverError) {
      return const ServerErrorScreen();
    } else if (provider.profileStates == ProfileStates.connectionError) {
      return const OfflineErrorScreen(
        currentScreenPath: RoutesName.editProfile,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            DefaultTextFormField(
              context: context,
              txt: 'Name',
              iconPath: AssetsPathes.userIcon,
              controller: nameController,
              validator: (value) {
                if (value!.isEmpty || value == '') {
                  return "name can't be empty";
                }
                return null;
              },
            ),
            const SizedBox(
              height: 30.0,
            ),
            DefaultTextFormField(
              context: context,
              txt: 'Email',
              iconPath: AssetsPathes.emailIcon,
              controller: emailController,
              keyboard: TextInputType.emailAddress,
              validator: (value) {
                if (!emailIsValid(value)) {
                  return 'Invalid Email';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            DefaultTextFormField(
              context: context,
              txt: 'Phone',
              iconPath: AssetsPathes.mobileIcon,
              controller: phoneController,
              keyboard: TextInputType.phone,
              validator: (value) {
                if (value!.length < 8) {
                  return 'Invalid phone number';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 60.0,
            ),
            // const Spacer(),
            ConfirmButton(
              onPressed: () {},
              txt: 'Save',
            ),
          ],
        ),
      ),
    );
  }
}
