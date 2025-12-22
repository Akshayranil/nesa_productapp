import 'package:nesa_machinetask/features/product_screen/domain/entity/product_entity.dart';

abstract class ProductDetailsState {}

class ProductDetailsLoading extends ProductDetailsState {}

class ProductDetailsLoaded extends ProductDetailsState {
  final Product product;
  ProductDetailsLoaded(this.product);
}

class ProductDetailsError extends ProductDetailsState {}
