import 'package:nesa_machinetask/features/product_screen/domain/entity/product_entity.dart';

abstract class EditProductEvent {}

class UpdateProductEvent extends EditProductEvent {
  final int id;
  final String title;
  final double price;
  final String description;
  final Product originalProduct;

  UpdateProductEvent({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.originalProduct
  });
}
