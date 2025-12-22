import 'package:dio/dio.dart';
import 'package:nesa_machinetask/features/product_screen/data/model/product_model.dart';



class ProductUpdateRemoteDataSource {
  final Dio dio;

  ProductUpdateRemoteDataSource(this.dio);

  // GET product by id (for edit screen)
  Future<ProductModel> getProductById(int id) async {
    final response = await dio.get('/products/$id');
    return ProductModel.fromJson(response.data);
  }

  // UPDATE product
  Future<void> updateProduct({
    required int id,
    required String title,
    required double price,
    required String description,
  }) async {
    await dio.put(
      '/products/$id',
      data: {
        "title": title,
        "price": price,
        "description": description,
      },
    );
  }
}
