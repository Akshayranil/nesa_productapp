

import 'package:nesa_machinetask/features/product_screen/domain/entity/product_entity.dart';

class ProductModel extends Product {
  ProductModel({
    required super.id,
    required super.title,
    required super.description,
    required super.price,
    required super.category,
    required super.thumbnail,
    required super.stock,
    required super.rating,
    
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: (json['price'] as num).toDouble(),
      category: json['category'],
      thumbnail: json['thumbnail'],
      rating: (json['stock'] as num).toDouble(),
      stock: (json['rating'] as num).toDouble()
    );
  }

    Product toEntity() {
    return Product(
      id: id,
      title: title,
      description: description,
      price: price,
      category: category,
      thumbnail: thumbnail,
      rating: rating,
      stock: stock,
    );
  }
}
