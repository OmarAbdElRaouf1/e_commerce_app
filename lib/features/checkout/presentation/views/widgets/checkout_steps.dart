import 'package:e_commerce_app/features/checkout/domain/entities/order_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'step_item.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps(
      {super.key, required this.currentStep, required this.pageController});
  final int currentStep;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(steps().length, (index) {
        return Expanded(
          child: GestureDetector(
            onTap: () {
              // Handle step tap
              if (context.read<OrderEntity>().payWithCash != null) {
                pageController.animateToPage(
                  index,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
            },
            child: StepItem(
              index: (index + 1).toString(),
              text: steps()[index],
              isActive: index <= currentStep,
            ),
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
