import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:equatable/equatable.dart';

class CartItemEntity extends Equatable {
  final ProductEntity productEntity;
  int quantity;

  CartItemEntity({
    required this.productEntity,
    this.quantity = 0,
  });
  int get calculateTotalPrice => productEntity.price * quantity;
  num calculateTotalWeight() => productEntity.unitAmount * quantity;
  void increaseQuantity() => quantity++;
  void decreaseQuantity() => quantity--;

  @override
  // TODO: implement props
  List<Object?> get props => [
        productEntity,
      ];
}
