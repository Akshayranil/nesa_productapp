import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nesa_machinetask/features/products_detailed/domain/usecase/product_detailusecase.dart';
import 'package:nesa_machinetask/features/products_detailed/presentation/bloc/productdetails_event.dart';
import 'package:nesa_machinetask/features/products_detailed/presentation/bloc/productdetails_state.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  final GetProductDetailsUseCase useCase;

  ProductDetailsBloc(this.useCase)
      : super(ProductDetailsLoading()) {
    on<FetchProductDetails>((event, emit) async {
      emit(ProductDetailsLoading());
      try {
        final product = await useCase(event.id);
        emit(ProductDetailsLoaded(product));
      } catch (_) {
        emit(ProductDetailsError());
      }
    });
  }
}
