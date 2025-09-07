import 'package:e_commerce_app/features/checkout/presentation/views/widgets/payment_section.dart';
import 'package:e_commerce_app/features/checkout/presentation/views/widgets/shipping_section.dart';
import 'package:flutter/material.dart';

import 'address_input_section.dart';

class CheckoutStepsPageView extends StatelessWidget {
  const CheckoutStepsPageView({
    super.key,
    required this.pageController,
    required this.formKey,
    required this.valueNotifier,
  });
  final GlobalKey<FormState> formKey;
  final PageController pageController;
  final ValueNotifier<AutovalidateMode> valueNotifier;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.horizontal,
      physics: NeverScrollableScrollPhysics(),
      controller: pageController,
      itemCount: getPages().length,
      itemBuilder: (context, index) {
        return getPages()[index];
      },
    );
  }

  List<Widget> getPages() {
    return [
      ShippingSection(),
      AddressInputSection(
        valueNotifier: valueNotifier,
        formKey: formKey,
      ),
      PaymentSection(),
    ];
  }
}
