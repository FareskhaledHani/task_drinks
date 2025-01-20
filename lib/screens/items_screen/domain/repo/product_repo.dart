import 'package:dartz/dartz.dart';
import 'package:new_test/core/network/models/api_error_model.dart';

import '../entity/product_entity.dart';

abstract class ProductRepo{
  Future<Either<ApiFaliureModel,List<ProductEntity>>>getProducts();
}