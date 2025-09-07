import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';

class InactiveStepItem extends StatelessWidget {
  const InactiveStepItem({super.key, required this.index, required this.text});
  final String index;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: 17),
        CircleAvatar(
          radius: 10,
          backgroundColor: Color(0xFFF2F3F3),
          child: Text(
            index,
            style: AppTextStyles.semiBold14.copyWith(color: Color(0xFF0C0D0D)),
          ),
        ),
        SizedBox(width: 4),
        Text(
          text,
          style: AppTextStyles.medium14.copyWith(color: Color(0xFFAAAAAA)),
        ),
      ],
    );
  }
}
