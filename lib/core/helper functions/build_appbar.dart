import 'package:flutter/material.dart';

import '../../core/utils/app_text_styles.dart';
import '../widgets/notification_widget.dart';

AppBar buildAppBar(se,
    {required String title,
    VoidCallback? onBackPressed,
    bool showBackButton = true,
    bool showNotification = true}) {
  return AppBar(
    surfaceTintColor: Colors.transparent,
    actions: [
      Visibility(
        visible: showNotification,
        child: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: NotificationWidget(),
        ),
      ),
    ],
    leading: Visibility(
      visible: showBackButton,
      child: GestureDetector(
          onTap: onBackPressed, child: Icon(Icons.arrow_back_ios_new)),
    ),
    backgroundColor: Colors.transparent,
    centerTitle: true,
    elevation: 0,
    title: Text(
      title,
      style: AppTextStyles.bold19,
    ),
  );
}
