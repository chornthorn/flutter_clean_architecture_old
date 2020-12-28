import 'package:get_it/get_it.dart';

import '../core/core.dart';
import '../data/data.dart';
import '../domain/domain.dart';
import '../view/view.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  // core
  sl.registerLazySingleton(() => CustomHttp());
  // blocs
  sl.registerLazySingleton(
    () => CategoryBloc(
      getCategoryListUseCase: sl(),
      saveCategoryListUseCase: sl(),
      deleteCategoryUseCase: sl(),
      updateCategoryUseCase: sl(),
    ),
  );

  // use case
  sl.registerLazySingleton(
    () => GetCategoryListUseCase(categoryRepository: sl()),
  );
  sl.registerLazySingleton(
    () => SaveCategoryListUseCase(categoryRepository: sl()),
  );
  sl.registerLazySingleton(
    () => DeleteCategoryUseCase(categoryRepository: sl()),
  );
  sl.registerLazySingleton(
    () => UpdateCategoryUseCase(categoryRepository: sl()),
  );
  // repository
  sl.registerLazySingleton<CategoryRepository>(
    () => CategoryRepositoryImpl(categoryRemoteDataSource: sl()),
  );

  // data
  sl.registerLazySingleton<CategoryRemoteDataSource>(
    () => CategoryRemoteDataSourceImpl(customHttp: sl()),
  );
}
