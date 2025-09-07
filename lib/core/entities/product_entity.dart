import 'package:e_commerce_app/core/entities/review_entity.dart';
import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String name;
  final String code;
  final String description;
  final num price;

  final bool isFeatured;
  String? imageUrl;
  final int expirationsMonths;

  final bool isOrganic;
  final int numberOfCalories;
  final int unitAmount;
  final num avgRating;
  final num ratingCount;
  final List<ReviewEntity> reviews;

  ProductEntity({
    required this.name,
    required this.numberOfCalories,
    required this.unitAmount,
    required this.expirationsMonths,
    required this.reviews,
    this.isOrganic = false,
    required this.code,
    required this.description,
    required this.price,
    this.isFeatured = false,
    required this.imageUrl,
    this.avgRating = 0,
    this.ratingCount = 0,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        code,
        name,
      ];
}
