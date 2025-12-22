

import 'package:nesa_machinetask/features/product_screen/domain/entity/product_entity.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts();
  Future<Product> getProductById(int id);
}
