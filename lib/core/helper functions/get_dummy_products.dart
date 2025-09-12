import 'package:e_commerce_app/core/entities/product_entity.dart';

ProductEntity getDummyProducts() {
  return ProductEntity(
    name: 'Apple',
    numberOfCalories: 95,
    unitAmount: 1,
    expirationsMonths: 6,
    reviews: [],
    code: '',
    description: '',
    price: 200,
    avgRating: 4.5,
    ratingCount: 10,
    imageUrl: 'https://image-processor-storage.s3.us-west-2.amazonaws.com/images/3cf61c1011912a2173ea4dfa260f1108/halo-of-neon-ring-illuminated-in-the-stunning-landscape-of-yosemite.jpg',
  );
}

List<ProductEntity> getdummyProducts() {
  return [
    getDummyProducts(),
    getDummyProducts(),
    getDummyProducts(),
    getDummyProducts(),
    getDummyProducts(),
    getDummyProducts(),
    getDummyProducts(),
    getDummyProducts(),
    getDummyProducts(),
    getDummyProducts(),
  ];
}
