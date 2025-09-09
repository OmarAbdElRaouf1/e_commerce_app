import 'package:e_commerce_app/core/cubits/products_cubit/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomErrorMessage extends StatelessWidget {
  const CustomErrorMessage({super.key, required this.errorMessage});
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: AlertDialog(
      title: Text('Error'),
      content: Text(errorMessage),
      actions: [
        TextButton(
          onPressed: () {
            context
                .read<ProductsCubit>()
                .getBestSellingProducts(); // Retry fetching products
          },
          child: Text('OK'),
        ),
      ],
    ));
  }
}
