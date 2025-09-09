import 'item.dart';

class ItemList {
  List<Item>? items;

  ItemList({this.items});

  Map<String, dynamic> toJson() => {
        'items': items?.map((e) => e.toJson()).toList(),
      };
}
