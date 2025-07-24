import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.hintText, required this.textInputType, this.suffixIcon, this.onSaved, this.obscureText = false});
  final String hintText;
  final TextInputType textInputType;
  final Widget? suffixIcon;
  final void Function(String?)? onSaved;
  final bool obscureText; // Default value for password fields

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      onSaved: onSaved,
      validator: (value) => value!.isEmpty ? 'هذا الحقل مطلوب' : null,
      keyboardType: textInputType,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: AppTextStyles.regular14,
        filled: true,
        fillColor: Color(0xFFF9FAFA),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: Color(0xFFE6E9E9), width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: Color(0xFFE6E9E9), width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: Color(0xFFE6E9E9), width: 1),
        ),
      ),
    );
  }
}
