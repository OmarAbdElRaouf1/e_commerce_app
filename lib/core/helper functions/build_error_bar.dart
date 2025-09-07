import 'package:flutter/material.dart';

void buildErrorBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: Duration(milliseconds: 800),
      behavior: SnackBarBehavior.floating,
      content: Text(message),
    ),
  );
}
