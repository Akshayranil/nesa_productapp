import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nesa_machinetask/features/product_editscreen/domain/usecase/update_productusecase.dart';
import 'package:nesa_machinetask/features/product_editscreen/presentation/bloc/editproduct_event.dart';
import 'package:nesa_machinetask/features/product_editscreen/presentation/bloc/editproduct_state.dart';
import 'package:nesa_machinetask/features/product_screen/data/model/product_model.dart';
import 'package:nesa_machinetask/features/product_screen/domain/entity/product_entity.dart';

class EditProductBloc extends Bloc<EditProductEvent, EditProductState> {
  final UpdateProductUseCase updateProductUseCase;

  EditProductBloc(this.updateProductUseCase)
      : super(EditProductInitial()) {
    on<UpdateProductEvent>((event, emit) async {
      emit(EditProductLoading());
      
      try {
        final updateProduct = ProductModel(
          id: event.id,
           title :event.title,
          price :event.price,
          description :event.description,
          category: event.originalProduct.category,
          thumbnail: event.originalProduct.thumbnail,
          stock: event.originalProduct.stock,
          rating: event.originalProduct.rating
        );
        emit(EditProductSuccess(updateProduct));
      } catch (_) {
        emit(EditProductError());
      }
    });
  }
}
