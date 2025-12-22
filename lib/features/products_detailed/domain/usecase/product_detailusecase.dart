import 'package:nesa_machinetask/features/product_screen/domain/entity/product_entity.dart';
import 'package:nesa_machinetask/features/product_screen/domain/repository/product_repository.dart';
import 'package:nesa_machinetask/features/products_detailed/data/repository/product_detailrepositoryimp.dart';


class GetProductDetailsUseCase {
  final ProductDetailrepositoryImp repository;

  GetProductDetailsUseCase(this.repository);

  Future<Product> call(int id) {
    return repository.getProductById(id);
  }
}
