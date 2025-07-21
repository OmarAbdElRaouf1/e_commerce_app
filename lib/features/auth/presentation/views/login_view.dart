import 'package:e_commerce_app/core/widgets/custom_appBar.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/login_view_body.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String routeName = 'login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        automaticallyImplyLeading: false,
        context: context,
        title: 'تسجيل دخول',
      ),
      body: SafeArea(child: LoginViewBody()),
    );
  }
}
