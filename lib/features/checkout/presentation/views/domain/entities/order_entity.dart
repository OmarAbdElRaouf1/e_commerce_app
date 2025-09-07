import 'package:e_commerce_app/features/checkout/presentation/views/domain/entities/shipping_address_entity.dart';
import 'package:e_commerce_app/features/home/domain/entities/cart_entity.dart';

class OrderEntity {
  final CartEntity cartEntity;
  bool? payWithCash;
  ShippingAddressEntity? shippingAddressEntity = ShippingAddressEntity();
  OrderEntity(this.cartEntity, {this.payWithCash, this.shippingAddressEntity});
}
