import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

AppBar CustomAppBar({
  required BuildContext context,
  required String title,
  bool? automaticallyImplyLeading,
}) {
  return AppBar(
    automaticallyImplyLeading: automaticallyImplyLeading ?? true,
    centerTitle: true,
    title: Text(
      title,
      style: AppTextStyles.bold19,
    ),
  );
}
