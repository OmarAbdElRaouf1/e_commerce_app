import 'dart:developer';

import 'package:e_commerce_app/core/helper%20functions/build_error_bar.dart';
import 'package:e_commerce_app/core/utils/app_keys.dart';
import 'package:e_commerce_app/features/checkout/domain/entities/order_entity.dart';
import 'package:e_commerce_app/features/checkout/domain/entities/paypal_payment_entity/paypal_payment_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

void processPayment(BuildContext context) {
  var orderEntity = context.read<OrderEntity>();
  PaypalPaymentEntity paypalPaymentEntity =
      PaypalPaymentEntity.fromEntity(orderEntity);
  log(paypalPaymentEntity.toJson().toString());
  Navigator.of(context).push(MaterialPageRoute(
    builder: (BuildContext context) => PaypalCheckoutView(
      sandboxMode: true,
      clientId: kPaypalSecretKey,
      secretKey: kPaypalClientId,
      transactions: [
        paypalPaymentEntity.toJson(),
      ],
      note: "Contact us for any questions on your order.",
      onSuccess: (Map params) async {
        print("onSuccess: $params");
        Navigator.pop(context);
        buildErrorBar(
          context,
          'تمت عملية الدفع بنجاح',
        );
      },
      onError: (error) {
        log("onError: $error");
      },
      onCancel: () {
        print('cancelled:');
      },
    ),
  ));
}
