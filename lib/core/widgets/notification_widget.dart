import 'package:flutter/material.dart';


class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: ShapeDecoration(
        color: const Color(0xFFEEF8ED) /* green-50 */,
        shape: OvalBorder(),
      ),
      child: IconButton(
        icon: const Icon(Icons.notifications, color: Color(0xFF4CAF50) /* green-500 */, size: 24),
        onPressed: () {},
      ),
    );
  }
}
