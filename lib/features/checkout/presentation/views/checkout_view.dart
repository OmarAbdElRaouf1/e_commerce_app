import 'package:e_commerce_app/core/helper%20functions/get_user.dart';
import 'package:e_commerce_app/core/repos/orders_repo/orders_repo.dart';
import 'package:e_commerce_app/core/services/getit_service.dart';
import 'package:e_commerce_app/features/checkout/presentation/manger/add_order_cubit/add_order_cubit.dart';
import 'package:e_commerce_app/features/checkout/presentation/views/widgets/add_order_cubit_bloc_consumer.dart';

import 'package:e_commerce_app/features/checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:e_commerce_app/features/home/domain/entities/cart_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../domain/entities/order_entity.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key, required this.cartEntity});
  static const String routeName = 'checkout';
  final CartEntity cartEntity;

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  late OrderEntity orderEntity;
  @override
  void initState() {
    orderEntity = OrderEntity(
      widget.cartEntity,
      uid: getUser().id,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddOrderCubit(getIt.get<OrdersRepo>()),
      child: Scaffold(
        body: Provider<OrderEntity>.value(
          value: orderEntity,
          child: AddOrderCubitBlocConsumer(child: const CheckoutViewBody()),
        ),
      ),
    );
  }
}
