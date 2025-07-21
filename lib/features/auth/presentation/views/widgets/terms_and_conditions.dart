import 'package:e_commerce_app/features/auth/presentation/views/widgets/custom_check_box.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({super.key});

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  @override
  bool isTermsAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(
          isChecked: isTermsAccepted,
          onChanged: (value) {
            isTermsAccepted = value;
            setState(() {}); // Trigger a rebuild to reflect the change
          },
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'من خلال إنشاء حساب ، فإنك توافق على ',
                  style: AppTextStyles.bold13.copyWith(
                    color: const Color(0xFF949D9E) /* Grayscale-400 */,
                  ),
                ),
                TextSpan(
                  text: 'الشروط والأحكام',
                  style: AppTextStyles.bold13.copyWith(
                    color: AppColors.lightPrimary,
                  ),
                ),
                TextSpan(
                  text: ' ',
                  style: AppTextStyles.bold13.copyWith(color: AppColors.primary),
                ),
                TextSpan(
                  text: 'الخاصة',
                  style: AppTextStyles.bold13.copyWith(
                    color: AppColors.lightPrimary,
                  ),
                ),
                TextSpan(
                  text: ' ',
                  style: AppTextStyles.bold13.copyWith(
                    color: AppColors.primary /* Grayscale-400 */,
                  ),
                ),
                TextSpan(
                  text: 'بنا',
                  style: AppTextStyles.bold13.copyWith(
                    color: AppColors.lightPrimary,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.right,
          ),
        )
      ],
    );
  }
}
