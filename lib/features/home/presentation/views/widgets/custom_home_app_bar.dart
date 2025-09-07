import 'package:e_commerce_app/core/utils/app_images.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../../core/helper functions/get_user.dart';
import '../../../../../core/widgets/notification_widget.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    var user = getUser();

    return Material(
      color: Colors.transparent,
      child: ListTile(
        trailing: NotificationWidget(),
        leading: Image.asset(Assets.imagesProfileImage),
        title: Text(
          'صباح الخير !..',
          textAlign: TextAlign.right,
          style: AppTextStyles.semiBold16.copyWith(
            color: const Color(0xFF949D9E),
          ),
        ),
        subtitle: Text(
          user.name,
          textAlign: TextAlign.right,
          style: AppTextStyles.bold16.copyWith(
            color: const Color(0xFF1A1C1D),
          ),
        ),
      ),
    );
  }
}
