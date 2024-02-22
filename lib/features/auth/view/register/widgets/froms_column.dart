import 'package:e_commerce/core/utils/shared/components/widgets/default_form_field.dart';
import 'package:e_commerce/core/utils/shared/constants/assets_pathes.dart';
import 'package:e_commerce/core/utils/shared/components/methods/app_methods.dart';
import 'package:e_commerce/features/auth/view_model/register_view_model.dart';
import 'package:flutter/material.dart';

class FormFiledsColumn extends StatelessWidget {
  const FormFiledsColumn({
    super.key,
    required TextEditingController nameController,
    required TextEditingController emailController,
    required TextEditingController phoneController,
    required TextEditingController passwordController,
    required TextEditingController rePasswordController,
    required this.provider,
  })  : _nameController = nameController,
        _emailController = emailController,
        _phoneController = phoneController,
        _passwordController = passwordController,
        _rePasswordController = rePasswordController;

  final TextEditingController _nameController;
  final RegisterViewModel provider;
  final TextEditingController _emailController;
  final TextEditingController _phoneController;
  final TextEditingController _passwordController;
  final TextEditingController _rePasswordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTextFormField(
          context: context,
          txt: 'Name',
          iconPath: AssetsPathes.userIcon,
          controller: _nameController,
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
          controller: _emailController,
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
          controller: _phoneController,
          keyboard: TextInputType.phone,
          validator: (value) {
            if (value!.length < 8) {
              return 'Invalid phone number';
            }
            return null;
          },
        ),
        const SizedBox(
          height: 20.0,
        ),
        DefaultTextFormField(
          context: context,
          txt: 'Password',
          iconPath: AssetsPathes.lockIcon,
          controller: _passwordController,
          keyboard: TextInputType.text,
          isPassword: true,
          onSuffexPressed: () {
            provider.changePasswordVisiblity();
          },
          isPasswordShown: provider.passwordShown,
          validator: (value) {
            if (value!.length < 6) {
              return 'Password is too short';
            }
            return null;
          },
        ),
        const SizedBox(
          height: 20.0,
        ),
        DefaultTextFormField(
          context: context,
          txt: 'Password again',
          iconPath: AssetsPathes.lockIcon,
          controller: _rePasswordController,
          keyboard: TextInputType.text,
          onSuffexPressed: () {
            provider.changeRePasswordVisiblity();
          },
          isPasswordShown: provider.rePasswordShown,
          isPassword: true,
          validator: (value) {
            if (value!.length < 6) {
              return 'Password is too short';
            }
            if (value != _passwordController.text) {
              return 'Passwords do not match';
            }
            return null;
          },
        ),
      ],
    );
  }
}
