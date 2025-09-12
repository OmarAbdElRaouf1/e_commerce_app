import 'package:e_commerce_app/features/checkout/domain/entities/shipping_address_entity.dart';
import 'package:e_commerce_app/features/home/domain/entities/cart_entity.dart';

class OrderEntity {
  final CartEntity cartEntity;
  bool? payWithCash;
  ShippingAddressEntity shippingAddressEntity = ShippingAddressEntity();
  final String uid;

  OrderEntity(
    this.cartEntity, {
    this.payWithCash,
    required this.uid,
  });
  int calculateShippingCost() {
    if (payWithCash!) {
      return 30;
    } else {
      return 0;
    }
  }

  int calculateShippingDiscount() {
    return 30 - calculateShippingCost();
  }

  int calculateTotalPriceAfterDiscount() {
    return cartEntity.calculateTotalPrice() +
        calculateShippingCost() -
        calculateShippingDiscount();
  }
}
