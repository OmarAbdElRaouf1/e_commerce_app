import 'package:e_commerce_app/core/entities/review_entity.dart';

class ReviewModel {
  final String name;
  final String image;
  final num rating;
  final String date;
  final String reviewDescription;

  ReviewModel({
    required this.name,
    required this.image,
    required this.rating,
    required this.date,
    required this.reviewDescription,
  });

  factory ReviewModel.fromEntity(ReviewEntity entity) {
    return ReviewModel(
      name: entity.name,
      image: entity.image,
      rating: entity.rating,
      date: entity.date,
      reviewDescription: entity.reviewDescription,
    );
  }
  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      name: json['name']?.toString() ?? '',
      image: json['image']?.toString() ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      date: json['date']?.toString() ?? '',
      reviewDescription: json['reviewDescription']?.toString() ?? '',
    );
  }
  ReviewEntity toEntity() {
    return ReviewEntity(
      name: name,
      image: image,
      rating: rating,
      date: date,
      reviewDescription: reviewDescription,
    );
  }

  Map<String, Object> toJson() {
    return {
      'name': name,
      'image': image,
      'rating': rating,
      'date': date,
      'reviewDescription': reviewDescription,
    };
  }
}
