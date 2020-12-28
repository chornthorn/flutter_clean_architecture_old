import 'package:get/get.dart';
import 'package:get_point/domain/usecases/product/search_product_usecase.dart';

import '../../../data/datasources/remote/product/product_remote_data_source.dart';
import '../../../data/repositories/product_repository_impl.dart';
import '../../../domain/repositories/product_repository.dart';
import '../../../domain/usecases/product/delete_product_usecase.dart';
import '../../../domain/usecases/product/get_product_list_usecase.dart';
import '../../../domain/usecases/product/save_product_usecase.dart';
import '../../../domain/usecases/product/update_product_usecase.dart';
import '../controller/product_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductRemoteDataSource>(() => ProductRemoteDataSourceImpl());
    Get.lazyPut<ProductRepository>(() => ProductRepositoryImpl(
        productRemoteDataSource: Get.find<ProductRemoteDataSource>()));
    Get.lazyPut<GetProductList>(
        () => GetProductList(productRepository: Get.find<ProductRepository>()));
    Get.lazyPut<SaveProductUseCase>(() =>
        SaveProductUseCase(productRepository: Get.find<ProductRepository>()));
    Get.lazyPut<DeleteProductUseCase>(() =>
        DeleteProductUseCase(productRepository: Get.find<ProductRepository>()));
    Get.lazyPut<UpdateProductUseCase>(() =>
        UpdateProductUseCase(productRepository: Get.find<ProductRepository>()));
    Get.lazyPut<SearchProductUseCase>(() =>
        SearchProductUseCase(productRepository: Get.find<ProductRepository>()));
    Get.lazyPut<ProductController>(
      () => ProductController(
        getProductList: Get.find<GetProductList>(),
        saveProductUseCase: Get.find<SaveProductUseCase>(),
        deleteProductUseCase: Get.find<DeleteProductUseCase>(),
        updateProductUseCase: Get.find<UpdateProductUseCase>(),
        searchProductUseCase: Get.find<SearchProductUseCase>(),
      ),
    );
  }
}

//import 'package:get/get.dart';
//
//import '../controller/product_controller.dart';
//import '../data/datasources/remote/product/product_remote_data_source.dart';
//import '../data/repositories/product_repository_impl.dart';
//import '../domain/repositories/product_repository.dart';
//import '../domain/usecases/product/delete_product_usecase.dart';
//import '../domain/usecases/product/get_product_list_usecase.dart';
//import '../domain/usecases/product/save_product_usecase.dart';
//import '../domain/usecases/product/update_product_usecase.dart';
//
//class ProductBinding extends Bindings {
//  @override
//  void dependencies() {
//    Get.lazyPut<ProductRemoteDataSource>(() => ProductRemoteDataSourceImpl());
//    Get.lazyPut<ProductRepository>(
//      () => ProductRepositoryImpl(
//        productRemoteDataSource: ProductRemoteDataSourceImpl(),
//      ),
//    );
//    Get.put<ProductController>(
//      ProductController(
//        getProductList: GetProductList(
//          productRepository: ProductRepositoryImpl(
//            productRemoteDataSource: ProductRemoteDataSourceImpl(),
//          ),
//        ),
//        saveProductUseCase: SaveProductUseCase(
//          productRepository: ProductRepositoryImpl(
//            productRemoteDataSource: ProductRemoteDataSourceImpl(),
//          ),
//        ),
//        deleteProductUseCase: DeleteProductUseCase(
//          productRepository: ProductRepositoryImpl(
//            productRemoteDataSource: ProductRemoteDataSourceImpl(),
//          ),
//        ),
//        updateProductUseCase: UpdateProductUseCase(
//          productRepository: ProductRepositoryImpl(
//            productRemoteDataSource: ProductRemoteDataSourceImpl(),
//          ),
//        ),
//      ),
//    );
//    Get.lazyPut<GetProductList>(
//      () => GetProductList(
//        productRepository: ProductRepositoryImpl(
//          productRemoteDataSource: ProductRemoteDataSourceImpl(),
//        ),
//      ),
//    );
//    Get.lazyPut<SaveProductUseCase>(
//      () => SaveProductUseCase(
//        productRepository: ProductRepositoryImpl(
//          productRemoteDataSource: ProductRemoteDataSourceImpl(),
//        ),
//      ),
//    );
//    Get.lazyPut<DeleteProductUseCase>(
//      () => DeleteProductUseCase(
//        productRepository: ProductRepositoryImpl(
//          productRemoteDataSource: ProductRemoteDataSourceImpl(),
//        ),
//      ),
//    );
//    Get.lazyPut<UpdateProductUseCase>(
//      () => UpdateProductUseCase(
//        productRepository: ProductRepositoryImpl(
//          productRemoteDataSource: ProductRemoteDataSourceImpl(),
//        ),
//      ),
//    );
//  }
//}
