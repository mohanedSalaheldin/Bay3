import 'package:e_commerce/core/configs/routes/routes_name.dart';
import 'package:e_commerce/core/utils/shared/components/widgets/loading_screen.dart';
import 'package:e_commerce/features/auth/view/register/widgets/register_body.dart';
import 'package:e_commerce/features/auth/view_model/register_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final rePasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RegisterViewModel>(
      create: (context) => RegisterViewModel(),
      child: Consumer<RegisterViewModel>(
        builder: (context, provider, child) {
          if (provider.registerStates == RegisterStates.success) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pushReplacementNamed(context, RoutesName.login);
            });
          }
          if (provider.registerStates == RegisterStates.loading) {
            return const LoadingScreen();
          } else {
            return Scaffold(
              body: buildRegisterBody(
                context: context,
                emailController: emailController,
                formKey: formKey,
                nameController: nameController,
                passwordController: passwordController,
                phoneController: phoneController,
                rePasswordController: rePasswordController,
                provider: provider,
              ),
            );
          }
        },
      ),
    );
  }
}
