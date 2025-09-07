import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:equatable/equatable.dart';

class CartItemEntity extends Equatable {
  final ProductEntity productEntity;
  int count;

  CartItemEntity({
    required this.productEntity,
    this.count = 0,
  });
  num get calculateTotalPrice => productEntity.price * count;
  num calculateTotalWeight() => productEntity.unitAmount * count;
  void increaseCount() => count++;
  void decreaseCount() => count--;

  @override
  // TODO: implement props
  List<Object?> get props => [
        productEntity,
      ];
}
