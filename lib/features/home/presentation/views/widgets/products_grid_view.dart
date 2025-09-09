import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/fruit_item.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key, required this.products});
  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 163 / 214,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (BuildContext context, int index) {
        return FruitItem(productEntity: products[index]);
      },
    );
  }
}
