import 'package:e_commerce_app/core/utils/app_text_styles.dart'
    show AppTextStyles;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';

class HaveAnAccount extends StatelessWidget {
  const HaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'تمتلك حساب بالفعل؟ ',
            style: AppTextStyles.semiBold16.copyWith(
              color: const Color(0xFF616A6B) /* Grayscale-600 */,
            ),
          ),
          TextSpan(
            text: ' تسجيل الدخول',
            style: AppTextStyles.bold16.copyWith(
              color: AppColors.primary,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pop(context);
              },
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
