import 'package:e_commerce_app/features/checkout/presentation/views/domain/entities/order_entity.dart';
import 'package:e_commerce_app/features/checkout/presentation/views/widgets/shipping_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection> with AutomaticKeepAliveClientMixin {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var orderEntity = context.watch<OrderEntity>();
    return Column(
      children: [
        SizedBox(
          height: 33,
        ),
        ShippingItem(
          onTap: () {
            selectedIndex = 0;
            setState(() {});
            orderEntity.payWithCash = true;
          },
          isSelected: selectedIndex == 0,
          title: 'الدفع عند الاستلام',
          subTitle: 'التسليم من المكان',
          price: '${(orderEntity.cartEntity.calculateTotalPrice() + 40).toString()} جنيه',
        ),
        SizedBox(
          height: 20,
        ),
        ShippingItem(
          onTap: () {
            selectedIndex = 1;
            setState(() {});
            orderEntity.payWithCash = false;
          },
          isSelected: selectedIndex == 1,
          title: '  الدفع اونلاين',
          subTitle: 'يرجي تحديد طريقه الدفع',
          price: '${orderEntity.cartEntity.calculateTotalPrice().toString()} جنيه',
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
