import 'package:flutter/material.dart';
import 'step_item.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps({
    super.key,
    required this.currentStep,
    required this.pageController,
  });
  final int currentStep;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(steps().length, (index) {
        return Expanded(
          child: StepItem(
            index: (index + 1).toString(),
            text: steps()[index],
            isActive: index <= currentStep - 1,
          ),
        );
      }),
    );
  }
}

List<String> steps() {
  return [
    'الشحن',
    'العنوان',
    'الدفع',
  ];
}
