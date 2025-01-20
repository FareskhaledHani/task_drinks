import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../domain/entity/product_entity.dart';
import '../domain/use_case/products_use_case.dart';

part 'product_event.dart';
part 'product_state.dart';
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductsUseCase _productsUseCase;

  ProductBloc(this._productsUseCase) : super(ProductInitial()) {
    on<GetProductsEvent>(_getProducts);
  }

  _getProducts(GetProductsEvent event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    print('loooooooooooooooooooooooooding');
    final result = await _productsUseCase.call();
    result.fold((l) {
      print("Error: ${l.message}"); // طباعة الخطأ
      emit(ProductFailure(errMassage: l.message));
      print('failllllllllllllllllllllllllllllllllllld');
    }, (r) {
      print("Products fetched: $r"); // طباعة البيانات
      emit(ProductSuccess(products: r));
      print('successssssssssssssssssssssssssssssssssssss');
    });
  }
}
