import 'package:e_commerce/core/configs/routes/routes_name.dart';
import 'package:e_commerce/core/utils/shared/components/widgets/default_button.dart';
import 'package:e_commerce/core/utils/shared/components/widgets/default_form_field.dart';
import 'package:e_commerce/core/utils/shared/components/widgets/default_text_buttin.dart';
import 'package:e_commerce/core/utils/shared/components/widgets/snack_bars.dart';
import 'package:e_commerce/core/utils/shared/components/widgets/top_container_in_login_and_register.dart';
import 'package:e_commerce/core/utils/shared/constants/assets_pathes.dart';
import 'package:e_commerce/core/utils/shared/components/methods/app_methods.dart';
import 'package:e_commerce/core/utils/shared/screen_sizes/screen_sizes.dart';
import 'package:e_commerce/features/auth/view_model/login_view_model.dart';
import 'package:flutter/material.dart';

SafeArea buildLoginBody(
    {required BuildContext context,
    required LoginViewModel provider,
    required TextEditingController passwordController,
    required TextEditingController emailController,
    required GlobalKey<FormState> formKey}) {
  if (provider.loginState == LoginStates.error) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showErrorSnackBar(context, provider.userLoginResult.message);
      provider.setLoginState(LoginStates.notRequested);
    });
  }

  return SafeArea(
    child: SingleChildScrollView(
      child: Column(
        children: [
          TopContainer(
              height: ScreenSizes.getHeight(context),
              width: ScreenSizes.getWidth(context)),
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
                    'Login',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(height: 0.0),
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
                    txt: 'Password',
                    iconPath: AssetsPathes.lockIcon,
                    controller: passwordController,
                    isPassword: true,
                    keyboard: TextInputType.text,
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
                  DefaultTextButton(
                    txt: 'Forgot Password?',
                    onpressed: () {},
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  ConfirmButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        provider.login(
                            userEmail: emailController.text,
                            password: passwordController.text);
                      }
                    },
                    txt: 'Login',
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Center(
                    child: DefaultTextButton(
                      txt: 'Create account',
                      onpressed: () {
                        Navigator.pushReplacementNamed(
                            context, RoutesName.register);
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
