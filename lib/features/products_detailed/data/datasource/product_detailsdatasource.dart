import 'package:dio/dio.dart';
import 'package:nesa_machinetask/features/product_screen/data/model/product_model.dart';

class ProductDetailsdatasource {
  final Dio dio;
  ProductDetailsdatasource(this.dio);

Future<ProductModel> getProductById(int id) async {
  final response = await dio.get('/products/$id');
  return ProductModel.fromJson(response.data);
}
}


