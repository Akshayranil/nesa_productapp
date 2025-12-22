import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nesa_machinetask/features/product_screen/domain/entity/product_entity.dart';
import 'package:nesa_machinetask/features/product_screen/domain/usecases/product_usecase.dart';

import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProducts getProducts;

  ProductBloc(this.getProducts) : super(ProductLoading()) {
    on<FetchProducts>((event, emit) async {
      try {
        final products = await getProducts();

        // group by category
        final Map<String, List<Product>> grouped = {};
        for (var product in products) {
          grouped.putIfAbsent(product.category, () => []);
          grouped[product.category]!.add(product);
        }

        emit(ProductLoaded(grouped));
      } catch (_) {
        emit(ProductError());
      }
    });
  }
}
