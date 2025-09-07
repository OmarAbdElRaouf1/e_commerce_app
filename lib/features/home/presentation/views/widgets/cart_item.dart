import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_images.dart';
import 'package:e_commerce_app/features/home/domain/entities/cart_item_entity.dart';
import 'package:e_commerce_app/features/home/presentation/cubits/cart_item_cubit/cart_item_cubit.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/cart_item_action_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../cubits/cart_cubit/cart_cubit.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItem});
  final CartItemEntity cartItem;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      buildWhen: (previous, current) {
        if (current is CartItemUpdated) {
          if (current.cartItemEntity == cartItem) {
            return true;
          }
        }
        return false;
      },
      builder: (context, state) {
        return IntrinsicHeight(
          child: Row(
            children: [
              Container(
                width: 73,
                height: 92,
                decoration: const BoxDecoration(color: Color(0xFFF3F5F7)),
                child: Image.network(
                  cartItem.productEntity.imageUrl!,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 17),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          cartItem.productEntity.name,
                          style: AppTextStyles.bold13,
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            // Handle delete action
                            context.read<CartCubit>().deleteCartItem(cartItem);
                          },
                          child: SvgPicture.asset(Assets.imagesTrash),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '${cartItem.calculateTotalWeight()} كم',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: AppColors.secondary,
                        fontSize: 13,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w400,
                        height: 1.60,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        CartItemActionButtons(
                          cartItemEntity: cartItem,
                        ),
                        const Spacer(),
                        Text(
                          '${cartItem.calculateTotalPrice} جنيه',
                          style: AppTextStyles.bold16.copyWith(
                            color: AppColors.secondary,
                          ),
                        ),
                        const SizedBox(width: 10),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
