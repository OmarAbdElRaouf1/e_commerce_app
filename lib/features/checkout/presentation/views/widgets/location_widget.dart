import 'package:e_commerce_app/core/utils/app_decorations.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({super.key, required this.child, required this.title});
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.bold13),
          SizedBox(height: 10),
          Container(
            height: MediaQuery.of(context).size.height * 0.05,
            width: double.infinity,
            decoration: AppDecorations.greyBoxDecroration,
            child: Center(child: child),
          )
        ],
      ),
    );
  }
}
