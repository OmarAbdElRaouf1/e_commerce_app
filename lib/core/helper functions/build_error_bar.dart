import 'package:flutter/material.dart';

void buildErrorBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: Duration(seconds: 10),
      behavior: SnackBarBehavior.floating,
      content: Text(message),
    ),
  );
}
