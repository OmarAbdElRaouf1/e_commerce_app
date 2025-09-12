import 'package:e_commerce_app/features/home/domain/entities/cart_item_entity.dart';

class OrderProductModel {
  final String name;
  final String code;
  final String imageUrl;
  final int quantity;
  final num price;

  OrderProductModel({
    required this.name,
    required this.code,
    required this.imageUrl,
    required this.quantity,
    required this.price,
  });
  factory OrderProductModel.fromEntity({required CartItemEntity entity}) {
    return OrderProductModel(
      name: entity.productEntity.name,
      code: entity.productEntity.code,
      imageUrl: entity.productEntity.imageUrl!,
      quantity: entity.productEntity.unitAmount,
      price: entity.quantity,
    );
  }
  Map<String, Object> ToJson() {
    return {
      'name': name,
      'code': code,
      'imageUrl': imageUrl,
      'quantity': quantity,
      'price': price,
    };
  }
}
