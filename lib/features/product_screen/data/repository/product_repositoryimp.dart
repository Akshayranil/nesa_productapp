

import 'package:nesa_machinetask/features/product_screen/data/product_datasource/product_datasource.dart';
import 'package:nesa_machinetask/features/product_screen/domain/entity/product_entity.dart';
import 'package:nesa_machinetask/features/product_screen/domain/repository/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Product>> getProducts() {
    return remoteDataSource.getProducts();
  }
}
