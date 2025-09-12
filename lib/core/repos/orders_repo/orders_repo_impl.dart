import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/failures.dart';
import 'package:e_commerce_app/core/repos/orders_repo/orders_repo.dart';
import 'package:e_commerce_app/core/services/database_service.dart';
import 'package:e_commerce_app/features/checkout/data/models/order_model.dart';
import 'package:e_commerce_app/features/checkout/domain/entities/order_entity.dart';

class OrdersRepoImpl implements OrdersRepo {
  final DatabaseService firestoreService;
  OrdersRepoImpl(this.firestoreService);
  @override
  Future<Either<Failure, void>> addOrder({required OrderEntity orderEntity}) async {
    try {
      await firestoreService.add(path: 'orders', data: OrderModel.fromEntity(orderEntity).toJson());
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
