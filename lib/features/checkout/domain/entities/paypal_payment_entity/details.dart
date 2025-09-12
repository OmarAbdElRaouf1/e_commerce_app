import '../order_entity.dart';

class Details {
  String? subtotal;
  String? shipping;
  String? shippingDiscount;

  Details({this.subtotal, this.shipping, this.shippingDiscount});

  Map<String, dynamic> toJson() => {
        'subtotal': subtotal,
        'shipping': shipping,
        'shipping_discount': shippingDiscount,
      };

  factory Details.fromEntity(OrderEntity entity) {
    return Details(
      subtotal: entity.cartEntity.calculateTotalPrice().toString(),
      shipping: entity.calculateShippingCost().toString(),
      shippingDiscount: entity.calculateShippingDiscount().toString(),
    );
  }
}
