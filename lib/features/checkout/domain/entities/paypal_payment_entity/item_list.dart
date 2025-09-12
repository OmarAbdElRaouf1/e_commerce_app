import 'package:e_commerce_app/features/home/domain/entities/cart_item_entity.dart';

import 'item.dart';

class ItemList {
  List<Item>? items;

  ItemList({this.items});
  factory ItemList.fromEntity({required List<CartItemEntity> cartItems}) {
    return ItemList(
      items: cartItems.map((e) => Item.fromEntity(e)).toList(),
    );
  }
  Map<String, dynamic> toJson() => {
        'items': items?.map((e) => e.toJson()).toList(),
      };
}
