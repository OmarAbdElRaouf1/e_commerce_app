import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/app_text_styles.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    super.key,
    required this.image,
    required this.label,
    required this.onPressed,
  });

  final String image;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: Colors.grey.shade300, width: 1),
          ),
          foregroundColor: Colors.black,
        ),
        onPressed: onPressed,
        child: ListTile(
          visualDensity: VisualDensity(vertical: VisualDensity.minimumDensity),
          leading: SvgPicture.asset(
            image,
          ),
          title: Text(label, textAlign: TextAlign.center, style: AppTextStyles.bold16),
        ),
      ),
    );
  }
}
