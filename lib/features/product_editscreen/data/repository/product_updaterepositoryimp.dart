import 'package:nesa_machinetask/features/product_editscreen/data/datasource/product_updatedatasource.dart';
import 'package:nesa_machinetask/features/product_editscreen/domain/repository/update_productrepository.dart';
import 'package:nesa_machinetask/features/product_screen/domain/entity/product_entity.dart';

class ProductUpdateRepositoryImpl implements UpdateProductrepository {
  final ProductUpdateRemoteDataSource remoteDataSource;

  ProductUpdateRepositoryImpl(this.remoteDataSource);

  // Future<List<Product>> getProducts() {
  //   return remoteDataSource.getProducts();
  // }
  
  @override
  Future<Product> getProductById(int id) {
    // TODO: implement getProductById
    throw UnimplementedError();
  }
  
  @override
  Future<void> updateProduct({required int id, required String title, required double price, required String description}) {
    // TODO: implement updateProduct
    throw UnimplementedError();
  }
}