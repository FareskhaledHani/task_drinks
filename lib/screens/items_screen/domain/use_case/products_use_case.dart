import 'package:dartz/dartz.dart';
import 'package:new_test/core/network/models/api_error_model.dart';

import '../entity/product_entity.dart';
import '../repo/product_repo.dart';

class ProductsUseCase{
  final ProductRepo _productRepo;

  ProductsUseCase(this._productRepo);
  Future<Either<ApiFaliureModel,List<ProductEntity>>>call()async{
    return await _productRepo.getProducts();
  }
}