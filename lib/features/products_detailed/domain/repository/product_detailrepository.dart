import 'package:nesa_machinetask/features/product_screen/domain/entity/product_entity.dart';

abstract class ProductDetailsRepository {
  Future<List<Product>> getProducts(int skip);
  Future<Product> getProductById(int id);
}
