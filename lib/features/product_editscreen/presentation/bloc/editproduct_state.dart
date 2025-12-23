import 'package:nesa_machinetask/features/product_screen/domain/entity/product_entity.dart';

abstract class EditProductState {}

class EditProductInitial extends EditProductState {}

class EditProductLoading extends EditProductState {}

class EditProductSuccess extends EditProductState {
  final Product updatedProducts;
  EditProductSuccess(this.updatedProducts);
}

class EditProductError extends EditProductState {}
