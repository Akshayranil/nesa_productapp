import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'productdetails_event.dart';
part 'productdetails_state.dart';

class ProductdetailsBloc extends Bloc<ProductdetailsEvent, ProductdetailsState> {
  ProductdetailsBloc() : super(ProductdetailsInitial()) {
    on<ProductdetailsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
