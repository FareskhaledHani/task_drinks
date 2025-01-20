import 'package:dartz/dartz.dart';
import 'package:new_test/core/network/exception/server_exception.dart';
import 'package:new_test/core/network/models/api_error_model.dart';
import '../data__source/product_data_source.dart';
import '../domain/entity/product_entity.dart';
import '../domain/repo/product_repo.dart';

class ProductRepoImpl extends  ProductRepo{
 final ProductDataSource _productDataSource;

  ProductRepoImpl(this._productDataSource);
  @override
  Future<Either<ApiFaliureModel, List<ProductEntity>>> getProducts() async{
   try{
     final result = await _productDataSource.getProducts();
     return Right(result);
   }on ServerException catch (failure){
     return Left(failure.errorModel);
   }


  }
}