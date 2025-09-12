import 'package:e_commerce_app/core/helper%20functions/get_currency.dart';
import 'package:e_commerce_app/features/checkout/domain/entities/order_entity.dart';

import 'details.dart';

class Amount {
  String? total;
  String? currency;
  Details? details;

  Amount({this.total, this.currency, this.details});
  factory Amount.fromEntity(OrderEntity entity) {
    return Amount(
      total: entity.calculateTotalPriceAfterDiscount().toString(),
      currency: getCurrency(),
      details: Details.fromEntity(entity),
    );
  }
  Map<String, Object?> toJson() {
    return {
      'total': total,
      'currency': currency,
      'details': details!.toJson(),
    };
  }
}
