import 'package:e_commerce/core/configs/routes/routes_name.dart';
import 'package:e_commerce/core/utils/shared/components/widgets/loading_screen.dart';
import 'package:e_commerce/features/auth/view/login/widgets/login_body.dart';
import 'package:e_commerce/features/auth/view_model/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginViewModel>(
      create: (context) => LoginViewModel(),
      child: Consumer<LoginViewModel>(
        builder: (context, provider, child) {
          if (provider.loginState == LoginStates.success) {
            WidgetsBinding.instance.addPostFrameCallback(
              (_) => Navigator.pushReplacementNamed(context, RoutesName.layout),
            );
          }
          if (provider.loginState case LoginStates.loading) {
            return const LoadingScreen();
          } else {
            return Scaffold(
              body: buildLoginBody(
                context: context,
                emailController: emailController,
                formKey: formKey,
                passwordController: passwordController,
                provider: provider,
              ),
            );
          }
        },
      ),
    );
  }
}
