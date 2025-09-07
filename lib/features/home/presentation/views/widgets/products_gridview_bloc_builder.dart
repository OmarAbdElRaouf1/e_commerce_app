import 'package:e_commerce_app/core/cubits/products_cubit/products_cubit.dart';
import 'package:e_commerce_app/core/helper%20functions/get_dummy_products.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/custom_error_message.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/products_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductsGridViewBlocBuilder extends StatelessWidget {
  const ProductsGridViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoaded) {
          return ProductsGridView(
            products: state.products,
          );
        } else if (state is ProductsError) {
          return SliverToBoxAdapter(
              child: CustomErrorMessage(errorMessage: state.errorMessage));
        } else {
          return Skeletonizer.sliver(
            enabled: true,
            child: ProductsGridView(
              products: getdummyProducts(),
            ),
          );
        }
      },
    );
  }
}
