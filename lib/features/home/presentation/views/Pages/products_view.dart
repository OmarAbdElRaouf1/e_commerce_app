import 'package:e_commerce_app/features/home/presentation/views/widgets/products_view_body.dart';
import 'package:flutter/material.dart';

class ProductsView extends StatelessWidget {
  static const String routeName = 'Products';
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: const ProductsViewBody());
  }
}
