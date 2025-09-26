import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:equatable/equatable.dart';

class CartItemEntity extends Equatable {
  final ProductEntity productEntity;
  int quantity;

  CartItemEntity({
    required this.productEntity,
    this.quantity = 1, // يبدأ من 1 بدل 0
  });

  int get calculateTotalPrice => productEntity.price * quantity;
  num calculateTotalWeight() => productEntity.unitAmount * quantity;

  void increaseQuantity() => quantity++;

  void decreaseQuantity() {
    if (quantity > 1) {
      quantity--;
    }
  }

  @override
  List<Object?> get props => [productEntity];
}
