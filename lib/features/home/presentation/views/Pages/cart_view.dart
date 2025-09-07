import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  static const String routeName = 'Cart';
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Your Cart is Empty'),
      ),
    );
  }
}
