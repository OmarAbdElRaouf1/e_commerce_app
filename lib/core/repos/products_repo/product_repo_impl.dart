import 'package:dartz/dartz.dart';

import 'package:e_commerce_app/core/entities/product_entity.dart';

import 'package:e_commerce_app/core/errors/failures.dart';
import 'package:e_commerce_app/core/models/product_model.dart';
import 'package:e_commerce_app/core/services/database_service.dart';

import 'product_repo.dart';

class ProductRepoImpl implements ProductRepo {
  final DatabaseService databaseService;

  ProductRepoImpl(this.databaseService);
  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts() async {
    try {
      var rawData = await databaseService.getData(
        path: 'products',
        query: {'limit': 10, 'orderBy': 'sellingCount', 'descending': true},
      );

      if (rawData == null) {
        return Right(<ProductEntity>[]);
      }

      final List<Map<String, dynamic>> result = (rawData as List)
          .where((item) => item != null)
          .map((item) => Map<String, dynamic>.from(item))
          .toList();

      List<ProductEntity> products = result
          .map((e) {
            try {
              return ProductModel.fromJson(e).toEntity();
            } catch (e) {
              print('Error parsing product: $e');
              return null;
            }
          })
          .where((product) => product != null)
          .cast<ProductEntity>()
          .toList();

      return Right(products);
    } catch (e) {
      return Left(ServerFailure('Failed to fetch products: $e'));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      var rawData = await databaseService.getData(path: 'products');

      final List<Map<String, dynamic>> result = (rawData as List)
          .map((item) => Map<String, dynamic>.from(item))
          .toList();

      List<ProductEntity> products =
          result.map((e) => ProductModel.fromJson(e).toEntity()).toList();

      return Right(products);
    } catch (e) {
      return Left(ServerFailure('Failed to fetch products: $e'));
    }
  }
}
