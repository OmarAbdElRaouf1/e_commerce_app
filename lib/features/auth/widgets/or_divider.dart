import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: Colors.grey[400],
          ),
        ),
        Text(
          '  أو  ',
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 16,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.w600,
            height: 1.40,
          ),
        ),
        Expanded(
          child: Divider(
            color: Colors.grey[400],
          ),
        ),
      ],
    );
  }
}
