

import 'package:nesa_machinetask/features/product_screen/domain/entity/product_entity.dart';
import 'package:nesa_machinetask/features/product_screen/domain/repository/product_repository.dart';

class GetProducts {
  final ProductRepository repository;

  GetProducts(this.repository);

  Future<List<Product>> call() {
    return repository.getProducts();
  }
}
