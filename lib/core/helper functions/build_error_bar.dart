import 'package:flutter/material.dart';

void buildErrorBar(BuildContext context, String message) {
  Color backgroundColor = Colors.red;
  if (message == 'تمت عملية الدفع بنجاح') {
    backgroundColor = Colors.green;
  }
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: backgroundColor,
      duration: Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      content: Text(message),
    ),
  );
}
