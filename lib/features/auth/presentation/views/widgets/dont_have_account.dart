import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../signup_view.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'ليس لديك حساب؟  ',
            style: AppTextStyles.semiBold16.copyWith(
              color: const Color(0xFF616A6B) /* Grayscale-600 */,
            ),
          ),
          TextSpan(
            text: 'قم بإنشاء حساب',
            style: AppTextStyles.bold16.copyWith(
              color: AppColors.primary,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamed(context, SignupView.routeName);
              },
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
