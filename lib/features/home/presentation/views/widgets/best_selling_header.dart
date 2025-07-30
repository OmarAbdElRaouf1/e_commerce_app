import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'الأكثر مبيعاً',
          style: AppTextStyles.bold19,
        ),
        const Spacer(),
        Text(
          'المزيد',
          textAlign: TextAlign.center,
          style: AppTextStyles.normal14.copyWith(
            color: const Color(0xFF949D9E), // grey-500
          ),
        )
      ],
    );
  }
}
