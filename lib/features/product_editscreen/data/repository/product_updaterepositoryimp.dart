import 'package:nesa_machinetask/features/product_editscreen/data/datasource/product_updatedatasource.dart';
import 'package:nesa_machinetask/features/product_editscreen/domain/repository/update_productrepository.dart';
import 'package:nesa_machinetask/features/product_screen/domain/entity/product_entity.dart';

class ProductUpdateRepositoryImpl implements UpdateProductrepository {
  final ProductUpdateRemoteDataSource remoteDataSource;

  ProductUpdateRepositoryImpl(this.remoteDataSource);

  Future<Product> getProductById(int id) {
    return remoteDataSource.getProductById(id);
  }

  @override
  Future<void> updateProduct({
    required int id,
    required String title,
    required double price,
    required String description,
  }) {
    return remoteDataSource.updateProduct(
      id: id,
      title: title,
      price: price,
      description: description,
    );
  }
}
