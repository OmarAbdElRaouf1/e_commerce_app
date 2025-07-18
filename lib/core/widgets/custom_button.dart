import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../utils/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          foregroundColor: Colors.white,
        ),
        onPressed: onPressed,
        child: Text(text, style: AppTextStyles.bold16),
      ),
    );
  }
}
