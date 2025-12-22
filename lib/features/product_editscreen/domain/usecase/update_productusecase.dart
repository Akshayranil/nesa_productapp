import 'package:nesa_machinetask/features/product_editscreen/domain/repository/update_productrepository.dart';
import 'package:nesa_machinetask/features/product_screen/domain/repository/product_repository.dart';

class UpdateProductUseCase {
  final UpdateProductrepository repository;

  UpdateProductUseCase(this.repository);

  Future<void> call(
    int id,
    String title,
    double price,
    String description,
  ) {
    return repository.updateProduct(
      id: id,
      title: title,
      price: price,
      description: description,
    );
  }
}
