import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';

class ActiveStepItem extends StatelessWidget {
  const ActiveStepItem({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: 17),
        CircleAvatar(
          foregroundColor: Colors.white,
          radius: 11.5,
          backgroundColor: AppColors.primary,
          child: Icon(
            Icons.check,
            size: 16,
          ),
        ),
        SizedBox(width: 4),
        Text(text,
            style: AppTextStyles.bold14.copyWith(color: AppColors.primary)),
      ],
    );
  }
}
