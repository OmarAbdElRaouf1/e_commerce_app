import 'package:flutter/material.dart';

import 'forget_password_button.dart';

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ForgotPasswordviewBody()),
          );
        },
        child: const Text('نسيت كلمة المرور؟'));
  }
}
