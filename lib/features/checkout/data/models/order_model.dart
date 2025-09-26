import 'package:e_commerce_app/features/checkout/data/models/order_product_model.dart';
import 'package:e_commerce_app/features/checkout/data/models/shipping_address_model.dart';
import 'package:e_commerce_app/features/checkout/domain/entities/order_entity.dart';
import 'package:uuid/uuid.dart';

class OrderModel {
  final num totalPrice;
  final String uid;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductModel> orderProducts;
  final String paymentMethod;
  final String orderId;

  OrderModel({
    required this.totalPrice,
    required this.uid,
    required this.orderId,
    required this.shippingAddressModel,
    required this.orderProducts,
    required this.paymentMethod,
  });

  factory OrderModel.fromEntity(OrderEntity entity) {
    return OrderModel(
      totalPrice: entity.cartEntity.calculateTotalPrice(),
      uid: entity.uid,
      orderId: Uuid().v4(),
      shippingAddressModel:
          ShippingAddressModel.fromEntity(entity.shippingAddressEntity),
      orderProducts: entity.cartEntity.cartItems
          .map((e) => OrderProductModel.fromEntity(entity: e))
          .toList(),
      paymentMethod: entity.payWithCash! ? 'Cash on Delivery' : 'Credit Card',
    );
  }
  Map<String, Object> toJson() {
    return {
      'totalPrice': totalPrice,
      'orderId': orderId,
      'uid': uid,
      'status': 'pending',
      'date': DateTime.now().toString(),
      'shippingAddress': shippingAddressModel.toJson(),
      'orderProducts': orderProducts.map((e) => e.toJson()).toList(),
      'paymentMethod': paymentMethod,
    };
  }
}
