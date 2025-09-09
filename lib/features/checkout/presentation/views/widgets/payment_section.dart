import 'package:e_commerce_app/features/checkout/presentation/views/widgets/order_summry_widget.dart';
import 'package:flutter/material.dart';

import 'location_summry.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 24),
        OrderSummryWidget(),
        SizedBox(height: 16),
        LocationSummry(pageController: pageController),
      ],
    );
  }
}
