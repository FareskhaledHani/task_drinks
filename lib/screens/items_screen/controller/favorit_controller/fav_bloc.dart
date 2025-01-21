import 'package:bloc/bloc.dart';

import '../../domain/entity/product_entity.dart';

class FavoriteCubit extends Cubit<List<ProductEntity>> {
  FavoriteCubit() : super([]);

  // دالة لإضافة أو إزالة المنتج من المفضلة
  void toggleFavorite(ProductEntity product) {
    final currentState = state;

    if (currentState.contains(product)) {
      // إذا كان المنتج في المفضلة بالفعل، قم بإزالته
      emit(currentState.where((item) => item != product).toList());
    } else {
      // إذا لم يكن في المفضلة، أضفه
      emit([...currentState, product]);
    }
  }
}
