import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:e_commerce_app/core/repos/products_repo/product_repo.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productsRepo) : super(ProductsInitial());
  final ProductRepo productsRepo;
  int productsLength = 0;

  /// emit آمنة تمنع الخطأ Bad State
  void safeEmit(ProductsState state) {
    if (!isClosed) emit(state);
  }

  Future<void> fetchProducts() async {
    safeEmit(ProductsLoading());
    final result = await productsRepo.getProducts();

    result.fold((error) => safeEmit(ProductsError(error.message)), (products) {
      safeEmit(ProductsLoaded(products));
      productsLength = products.length;
    });
  }

  Future<void> getBestSellingProducts() async {
    safeEmit(ProductsLoading());
    final result = await productsRepo.getBestSellingProducts();

    result.fold(
      (error) {
        log('❌ Best Selling Products Error: ${error.message}');
        safeEmit(ProductsError(error.message));
      },
      (products) {
        log('✅ Best Selling Products Loaded: ${products.length} items');
        productsLength = products.length;
        safeEmit(ProductsLoaded(products));
      },
    );
  }
}
