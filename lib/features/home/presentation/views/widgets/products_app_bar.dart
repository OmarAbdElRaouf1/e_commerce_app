import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/notification_widget.dart';

class ProductsAppBar extends StatelessWidget {
  const ProductsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: ListTile(
        trailing: NotificationWidget(),
        title: Center(
          child: Text(
            'الأكثر مبيعًا',
            textAlign: TextAlign.right,
            style: AppTextStyles.semiBold16.copyWith(
              color: const Color(0xFF949D9E),
            ),
          ),
        ),
      ),
    );
  }
}
