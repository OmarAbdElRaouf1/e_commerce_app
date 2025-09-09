import 'package:e_commerce_app/core/helper%20functions/build_error_bar.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:e_commerce_app/features/checkout/domain/entities/order_entity.dart';
import 'package:e_commerce_app/features/checkout/presentation/views/widgets/checkout_steps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

import '../../../../../core/helper functions/build_appbar.dart';
import '../../manger/add_order_cubit/add_order_cubit.dart';
import 'checkout_steps_page_view.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController pageController;
  @override
  ValueNotifier<AutovalidateMode> valueNotifier =
      ValueNotifier(AutovalidateMode.disabled);
  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentStep = pageController.page!.toInt();
      });
    });
  }

  @override
  void dispose() {
    valueNotifier.dispose();
    pageController.dispose();
    super.dispose();
  }

  int currentStep = 0;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(
          context,
          title: 'الشحن',
          showNotification: false,
          showBackButton: true,
          onBackPressed: () {
            if (pageController.page == 0) {
              Navigator.pop(context);
            } else {
              pageController.previousPage(
                  duration: Duration(milliseconds: 250),
                  curve: Curves.easeInOut);
            }
          },
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 16),
              CheckoutSteps(
                pageController: pageController,
                currentStep: currentStep,
              ),
              SizedBox(height: 16),
              Expanded(
                child: CheckoutStepsPageView(
                  valueNotifier: valueNotifier,
                  pageController: pageController,
                  formKey: formKey,
                ),
              ),
              CustomButton(
                onPressed: () {
                  if (currentStep == 0) {
                    handelShippingSectionValidation(context);
                  } else if (currentStep == 1) {
                    handelAddressValidation(context);
                  } else {
                    // var orderEntity = context.read<OrderEntity>();
                    // context.read<AddOrderCubit>().addOrder(orderEntity: orderEntity);
                    processPayment(context);
                  }
                },
                text: currentStep == 2 ? 'الدفع عبر PayPal' : 'التالي',
              ),
              SizedBox(height: 40),
            ],
          ),
        ));
  }

  void handelShippingSectionValidation(BuildContext context) {
    if (context.read<OrderEntity>().payWithCash != null) {
      pageController.animateToPage(
        currentStep + 1,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      buildErrorBar(context, 'اختر طريقه للدفع');
    }
  }

  void handelAddressValidation(BuildContext context) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      pageController.animateToPage(
        currentStep + 1,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      valueNotifier.value = AutovalidateMode.always;
    }
  }

  void processPayment(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: "",
        secretKey: "",
        transactions: const [
          {
            "amount": {
              "total": '70',
              "currency": "USD",
              "details": {
                "subtotal": '70',
                "shipping": '0',
                "shipping_discount": 0
              }
            },
            "description": "The payment transaction description.",
            // "payment_options": {
            //   "allowed_payment_method":
            //       "INSTANT_FUNDING_SOURCE"
            // },
            "item_list": {
              "items": [
                {
                  "name": "Apple",
                  "quantity": 4,
                  "price": '5',
                  "currency": "USD"
                },
                {
                  "name": "Pineapple",
                  "quantity": 5,
                  "price": '10',
                  "currency": "USD"
                }
              ],
            }
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          print("onSuccess: $params");
        },
        onError: (error) {
          print("onError: $error");
          Navigator.pop(context);
        },
        onCancel: () {
          print('cancelled:');
        },
      ),
    ));
  }
}
