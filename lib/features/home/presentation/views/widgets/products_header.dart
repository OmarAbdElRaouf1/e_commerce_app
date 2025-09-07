import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';

class ProductsHeader extends StatefulWidget {
  const ProductsHeader({super.key, required this.productsLenght});
  final int productsLenght;

  @override
  State<ProductsHeader> createState() => _ProductsHeaderState();
}

class _ProductsHeaderState extends State<ProductsHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '  ${widget.productsLenght}  نتائج ',
          style: AppTextStyles.bold19,
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: ShapeDecoration(
            color: Colors.white.withValues(alpha: 0.10),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: const Color(0x66CACECE),
              ),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        )
      ],
    );
  }
}
