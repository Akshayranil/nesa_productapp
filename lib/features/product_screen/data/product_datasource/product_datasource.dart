import 'package:dio/dio.dart';
import 'package:nesa_machinetask/features/product_screen/data/model/product_model.dart';


class ProductRemoteDataSource {
  final Dio dio;

  ProductRemoteDataSource(this.dio);

  Future<List<ProductModel>> getProducts() async {
    final response = await dio.get('/products');
    final List products = response.data['products'];
    return products.map((e) => ProductModel.fromJson(e)).toList();
  }
}
