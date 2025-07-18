import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

AppBar CustomAppBar({
  required BuildContext context,
  required String title,
}) {
  return AppBar(
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios_new),
      onPressed: () => Navigator.pop(context),
    ),
    centerTitle: true,
    title: Text(
      title,
      style: AppTextStyles.bold19,
    ),
  );
}
