import 'package:e_commerce_app/features/checkout/domain/entities/shipping_address_entity.dart';

class ShippingAddressModel {
  String? name;
  String? phone;
  String? address;
  String? city;
  String? email;
  String? addressDetails;

  ShippingAddressModel({
    this.addressDetails,
    this.name,
    this.phone,
    this.address,
    this.city,
    this.email,
  });
  factory ShippingAddressModel.fromEntity(ShippingAddressEntity entity) {
    return ShippingAddressModel(
      name: entity.name,
      phone: entity.phone,
      address: entity.address,
      city: entity.city,
      email: entity.email,
      addressDetails: entity.addressDetails,
    );
  }
  @override
  String toString() {
    return '$address, $addressDetails';
  }

  toJson() {
    return {
      'name': name,
      'phone': phone,
      'address': address,
      'city': city,
      'email': email,
      'addressDetails': addressDetails,
    };
  }
}
