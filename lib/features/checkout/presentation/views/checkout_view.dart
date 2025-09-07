import 'package:e_commerce_app/features/checkout/presentation/views/domain/entities/order_entity.dart';
import 'package:e_commerce_app/features/checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:e_commerce_app/features/home/domain/entities/cart_entity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key, required this.cartEntity});
  static const String routeName = 'checkout';
  final CartEntity cartEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider.value(
        value: OrderEntity(cartEntity),
        child: CheckoutViewBody(),
      ),
    );
  }
}
