import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nesa_machinetask/features/product_editscreen/domain/usecase/update_productusecase.dart';
import 'package:nesa_machinetask/features/product_editscreen/presentation/bloc/editproduct_event.dart';
import 'package:nesa_machinetask/features/product_editscreen/presentation/bloc/editproduct_state.dart';

class EditProductBloc extends Bloc<EditProductEvent, EditProductState> {
  final UpdateProductUseCase updateProductUseCase;

  EditProductBloc(this.updateProductUseCase)
      : super(EditProductInitial()) {
    on<UpdateProductEvent>((event, emit) async {
      emit(EditProductLoading());
      try {
        await updateProductUseCase(
          event.id,
          event.title,
          event.price,
          event.description,
        );
        emit(EditProductSuccess());
      } catch (_) {
        emit(EditProductError());
      }
    });
  }
}
