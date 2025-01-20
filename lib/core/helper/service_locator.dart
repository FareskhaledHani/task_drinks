import 'package:get_it/get_it.dart';

import '../../screens/items_screen/controller/product_bloc.dart';
import '../../screens/items_screen/data__source/product_data_source.dart';
import '../../screens/items_screen/domain/repo/product_repo.dart';
import '../../screens/items_screen/domain/use_case/products_use_case.dart';
import '../../screens/items_screen/repo/product_repo_impl.dart';
import '../network/network_provider/api_services.dart';
import '../network/network_provider/dio_api_service_impl.dart';

GetIt getIt = GetIt.instance;


  setupSingeltonServices()async{
    getIt.registerLazySingleton<ApiService>(() => DioApiServiceImpl());
    _productDi();

  }
  _productDi(){
getIt.registerLazySingleton<ProductDataSource>(()=>ProductDataSourceImpl(getIt()));
getIt.registerLazySingleton<ProductRepo>(()=>ProductRepoImpl(getIt()));
getIt.registerLazySingleton(()=>ProductsUseCase(getIt()));
getIt.registerFactory(()=>ProductBloc(getIt()));
  }
