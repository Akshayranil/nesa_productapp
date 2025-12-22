import 'package:nesa_machinetask/features/product_screen/domain/entity/product_entity.dart';
import 'package:nesa_machinetask/features/products_detailed/data/datasource/product_detailsdatasource.dart';
import 'package:nesa_machinetask/features/products_detailed/domain/repository/product_detailrepository.dart';




class ProductDetailrepositoryImp implements ProductDetailsRepository{
  final ProductDetailsdatasource remotedatasource;
  ProductDetailrepositoryImp(this.remotedatasource);

  Future<Product> getProductById(int id) async {
  final model = await remotedatasource.getProductById(id);
  
  return model.toEntity();
}

  @override
  Future<List<Product>> getProducts(int skip) {
    // TODO: implement getProducts
    throw UnimplementedError();
  }

}

