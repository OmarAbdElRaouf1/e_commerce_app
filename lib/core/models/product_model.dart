import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:e_commerce_app/core/entities/review_entity.dart';
import 'package:e_commerce_app/core/helper%20functions/get_avg_rating.dart';
import 'package:e_commerce_app/core/models/review_model.dart';

class ProductModel {
  final String name;
  final String code;
  final String description;
  final num price;

  final bool isFeatured;
  String? imageUrl;
  final int expirationsMonths;
  final List<ReviewEntity> reviews;
  final bool isOrganic;
  final int numberOfCalories;
  final int unitAmount;
  final num avgRating;
  final num sellingCount;
  final num ratingCount = 0;

  ProductModel({
    required this.avgRating,
    required this.reviews,
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    this.isFeatured = false,
    this.imageUrl,
    required this.expirationsMonths,
    required this.sellingCount,
    this.isOrganic = false,
    required this.numberOfCalories,
    required this.unitAmount,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      avgRating: getAvgRating(json['review']),
      name: json['name'],
      code: json['code'],
      description: json['description'],
      price: json['price'],
      isFeatured: json['isFeatured'] ?? false,
      imageUrl: json['imageUrl'],
      expirationsMonths: json['expirationsMonths'],
      isOrganic: json['isOrganic'] ?? false,
      numberOfCalories: json['numberOfCalories'],
      unitAmount: json['unitAmount'],
      reviews: json['review'] != null
          ? (json['review'] as List<dynamic>)
              .map(
                (review) => ReviewModel.fromJson(review as Map<String, dynamic>)
                    as ReviewEntity,
              )
              .toList()
          : <ReviewEntity>[],
      sellingCount: json['sellingCount'] ?? 0,
    );
  }

  ProductEntity toEntity() {
    return ProductEntity(
      name: name,
      code: code,
      description: description,
      price: price,
      isFeatured: isFeatured,
      imageUrl: imageUrl,
      expirationsMonths: expirationsMonths,
      isOrganic: isOrganic,
      numberOfCalories: numberOfCalories,
      unitAmount: unitAmount,
      reviews: reviews,
      avgRating: avgRating,
      ratingCount: ratingCount,
    );
  }
}
