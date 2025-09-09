import 'package:e_commerce_app/features/home/presentation/views/widgets/cart_header.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/cart_item_list.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/custom_divider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helper functions/build_appbar.dart';
import '../../cubits/cart_cubit/cart_cubit.dart';
import 'custom_cart_button.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  buildAppBar(context,
                      title: 'المنتجات',
                      showBackButton: false,
                      showNotification: false),
                  SizedBox(height: 16),
                  CartHeader(),
                  SizedBox(height: 12),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: context.read<CartCubit>().cartEntity.cartItems.isNotEmpty
                  ? CustomDivider()
                  : SizedBox.shrink(),
            ),
            CartItemList(
                cartItems: context.watch<CartCubit>().cartEntity.cartItems),
            SliverToBoxAdapter(
              child: context.read<CartCubit>().cartEntity.cartItems.isNotEmpty
                  ? CustomDivider()
                  : SizedBox.shrink(),
            ),
          ],
          // Products GridView
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.height * 0.03,
          left: 8,
          right: 8,
          child: CustomCartButton(),
        )
      ],
    );
  }
}
