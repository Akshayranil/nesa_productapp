

import 'package:nesa_machinetask/features/product_screen/domain/entity/product_entity.dart';

abstract class ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final Map<String, List<Product>> groupedProducts;
  ProductLoaded(this.groupedProducts);
}

class ProductError extends ProductState {}
