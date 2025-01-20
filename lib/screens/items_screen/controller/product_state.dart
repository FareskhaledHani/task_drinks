part of 'product_bloc.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}
final class ProductSuccess extends ProductState{
  final List<ProductEntity> products;

  ProductSuccess({required this.products});
}
final class ProductFailure extends ProductState{
  final String errMassage;

  ProductFailure({required this.errMassage});
}
final class ProductLoading extends ProductState{}
