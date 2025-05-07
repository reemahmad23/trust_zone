import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:trust_zone/features/home/data/data_sources/category_remote_data_source.dart';
import 'package:trust_zone/features/home/data/data_sources/profile_remote_data_source.dart';
import 'package:trust_zone/features/home/data/repo/category_repo_im.dart';
import 'package:trust_zone/features/home/data/repo/place_repo_im.dart';
import 'package:trust_zone/features/home/data/repo/profile_repo_im.dart';
import 'package:trust_zone/features/home/domain/repo/category_repo.dart';
import 'package:trust_zone/features/home/domain/repo/place_repo.dart';
import 'package:trust_zone/features/home/domain/repo/profile_repo.dart';
import 'package:trust_zone/features/home/domain/use_cases/get_category_id.dart';
import 'package:trust_zone/features/home/domain/use_cases/get_places.dart';
import 'package:trust_zone/features/home/domain/use_cases/get_profile_use_case.dart';
import 'package:trust_zone/features/home/domain/use_cases/update_profile_use_case.dart';
import 'package:trust_zone/features/home/presentation/manager/branch_cubit/branch_cubit.dart';
import 'package:trust_zone/features/home/presentation/manager/category_cubit/category_cubit.dart';
import 'package:trust_zone/features/home/presentation/manager/places_cubit/places_cubit.dart';
import 'package:trust_zone/features/home/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:trust_zone/utils/places_api_service.dart';
import 'package:trust_zone/utils/profile_api_service.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  // Dio & API
sl.registerLazySingleton<ProfileApiService>(
  () => ProfileApiService(Dio()),
);


  // ---------------------- Profile ----------------------

  // Data sources
  sl.registerLazySingleton<ProfileRemoteDataSource>(() => ProfileRemoteDataSourceImpl(sl()));

  // Repository
  sl.registerLazySingleton<ProfileRepo>(() => ProfileRepoImpl(sl()));

  // Use cases
  sl.registerLazySingleton(() => GetProfileUseCase(sl()));
  sl.registerLazySingleton(() => UpdateProfileUseCase(sl()));

  // Cubit
  sl.registerFactory(() => ProfileCubit(
    getProfileUseCase: sl(),
    updateProfileUseCase: sl(),
  ));

  // ---------------------- Category ----------------------

  // Data sources
  sl.registerLazySingleton<CategoryRemoteDataSource>(() => CategoryRemoteDataSourceImpl());

  // Repository
  sl.registerLazySingleton<CategoryRepository>(() => CategoryRepositoryImpl(sl()));

  // Use cases
  sl.registerLazySingleton(() => GetCategoriesUseCase(sl()));
  sl.registerLazySingleton(() => GetCategoryByIdUseCase(sl()));
  sl.registerLazySingleton(() => AddCategoryUseCase(sl()));
  sl.registerLazySingleton(() => UpdateCategoryUseCase(sl()));
  sl.registerLazySingleton(() => DeleteCategoryUseCase(sl()));

  // Cubit
  sl.registerFactory(() => CategoryCubit(
    getCategoriesUseCase: sl(),
    getCategoryByIdUseCase: sl(),
    addCategoryUseCase: sl(),
    updateCategoryUseCase: sl(),
    deleteCategoryUseCase: sl(),
  ));


  // Repository
  sl.registerLazySingleton<BranchRepository>(
  () => BranchRepositoryImpl(apiService: sl()),
);


  // UseCase
    sl.registerLazySingleton(() => GetBranchesByCategoryUseCase(sl()));


  // Cubit
  sl.registerFactory<BranchCubit>(() => BranchCubit(sl()));
}
