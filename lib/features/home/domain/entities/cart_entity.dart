import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:e_commerce_app/features/home/domain/entities/cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> items;

  CartEntity(this.items);

  void addCartItem(CartItemEntity cartItem) {
    items.add(cartItem);
  }

  void removeCartItem(CartItemEntity cartItem) {
    items.remove(cartItem);
  }

  num calculateTotalPrice() {
    num total = 0;
    for (var item in items) {
      total += item.calculateTotalPrice;
    }
    return total;
  }

  bool isExist(ProductEntity productEntity) {
    for (var cartItem in items) {
      if (cartItem.productEntity == productEntity) {
        return true;
      }
    }
    return false;
  }

  CartItemEntity getCartItem(ProductEntity productEntity) {
    for (var cartItem in items) {
      if (cartItem.productEntity == productEntity) {
        return cartItem;
      }
    }
    return CartItemEntity(productEntity: productEntity, count: 1);
  }
}
