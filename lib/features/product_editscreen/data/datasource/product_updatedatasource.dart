import 'package:dio/dio.dart';

class ProductUpdateRemoteDataSource {
  final Dio dio;

  ProductUpdateRemoteDataSource(this.dio);
  
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
