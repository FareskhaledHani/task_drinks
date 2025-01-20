import 'package:new_test/core/network/api_constants.dart';
import '../../../../core/network/exception/server_exception.dart';
import '../../../../core/network/network_provider/api_services.dart';
import '../domain/entity/product_entity.dart';
import '../model/product_model.dart';

abstract class ProductDataSource {
  Future<List<ProductEntity>> getProducts();
}

class ProductDataSourceImpl extends ProductDataSource {
  final ApiService _apiService;

  ProductDataSourceImpl(this._apiService);

  @override
  Future<List<ProductEntity>> getProducts() async {
    final result = await _apiService.get(ApiConstants.getProducts);
    print(result);


    return result.fold(
          (l) {
        print("Error in API: ${l.message}");  // طباعة الخطأ
        throw ServerException(errorModel: l);
      },
          (r) {
            print(r);
        final productsJson = r.data as List<dynamic>; // تأكد من تحويل البيانات بالشكل الصحيح
        final products = productsJson
            .map((productJson) => ProductModel.fromJson(productJson))
            .toList();
        print("Products fetched: $products");  // طباعة المنتجات
        return products;
      },
    );
  }
}
