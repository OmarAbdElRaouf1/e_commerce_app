import 'package:e_commerce_app/core/cubits/products_cubit/products_cubit.dart';
import 'package:e_commerce_app/core/helper%20functions/build_appbar.dart';
import 'package:e_commerce_app/core/widgets/search_text_field.dart';
import 'package:e_commerce_app/features/home/presentation/views/main_view.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/products_gridview_bloc_builder.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/products_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsViewBody extends StatefulWidget {
  const ProductsViewBody({super.key});

  @override
  State<ProductsViewBody> createState() => _ProductsViewBodyState();
}

class _ProductsViewBodyState extends State<ProductsViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<ProductsCubit>().fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                buildAppBar(context, title: 'المنتجات', showBackButton: false, showNotification: true, onBackPressed: () {
                  Navigator.pushNamed(context, MainView.routeName);
                }),
                SizedBox(height: 16),
                SearchTextField(),
                SizedBox(height: 12),
                ProductsHeader(productsLenght: context.watch<ProductsCubit>().productsLength),
                SizedBox(height: 12),
              ],
            ),
          ),
          ProductsGridViewBlocBuilder(),
        ],
        // Products GridView
      ),
    );
  }
}
