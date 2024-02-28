import 'package:e_commerce/core/configs/routes/routes_name.dart';
import 'package:e_commerce/core/utils/shared/components/widgets/default_button.dart';
import 'package:e_commerce/core/utils/shared/components/widgets/default_text_buttin.dart';
import 'package:e_commerce/core/utils/shared/components/widgets/snack_bars.dart';
import 'package:e_commerce/core/utils/shared/components/widgets/top_container_in_login_and_register.dart';
import 'package:e_commerce/core/utils/shared/screen_sizes/screen_sizes.dart';
import 'package:e_commerce/features/auth/view/register/widgets/froms_column.dart';
import 'package:e_commerce/features/auth/view_model/register_view_model.dart';
import 'package:flutter/material.dart';

SafeArea buildRegisterBody(
    {required BuildContext context,
    required RegisterViewModel provider,
    required TextEditingController nameController,
    required TextEditingController emailController,
    required TextEditingController phoneController,
    required TextEditingController passwordController,
    required TextEditingController rePasswordController,
    required GlobalKey<FormState> formKey}) {
  if (provider.registerStates == RegisterStates.error) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showErrorSnackBar(context, provider.userRegisterResult.message);
      provider.setRegisterState(RegisterStates.notRequested);
    });
  }
  return SafeArea(
    child: SingleChildScrollView(
      child: Column(
        children: [
          TopContainer(
            height: ScreenSizes.getHeight(context) - 60,
            width: ScreenSizes.getWidth(context),
            isRegister: true,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 50, left: 50),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: ScreenSizes.getHeight(context)),
                  Text(
                    'Register',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(height: 0.0),
                  ),
                  const SizedBox(height: 30.0),
                  FormFiledsColumn(
                    nameController: nameController,
                    emailController: emailController,
                    phoneController: phoneController,
                    passwordController: passwordController,
                    rePasswordController: rePasswordController,
                    provider: provider,
                  ),
                  const SizedBox(height: 20.0),
                  ConfirmButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          provider.register(
                            userEmail: emailController.text,
                            userName: nameController.text,
                            password: passwordController.text,
                            phone: phoneController.text,
                            image: 'image',
                          );
                        }
                      },
                      txt: 'Register'),
                  const SizedBox(height: 10.0),
                  Center(
                    child: DefaultTextButton(
                      txt: 'Have an account?',
                      onpressed: () {
                        Navigator.pushReplacementNamed(
                            context, RoutesName.login);
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}
