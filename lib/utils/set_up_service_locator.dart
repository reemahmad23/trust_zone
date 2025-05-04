import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:trust_zone/features/home/data/data_sources/profile_remote_data_source.dart';
import 'package:trust_zone/features/home/data/repo/profile_repo_im.dart';
import 'package:trust_zone/features/home/domain/repo/profile_repo.dart';
import 'package:trust_zone/features/home/domain/use_cases/get_profile_use_case.dart';
import 'package:trust_zone/features/home/domain/use_cases/update_profile_use_case.dart';
import 'package:trust_zone/features/home/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:trust_zone/utils/api_service.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  // Dio & API Service
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => ApiService());

  // Data sources
  sl.registerLazySingleton<ProfileRemoteDataSource>(() => ProfileRemoteDataSourceImpl(sl()));

  // Repository
  sl.registerLazySingleton<ProfileRepo>(() => ProfileRepoImpl(sl()));

  // Use cases
  sl.registerLazySingleton(() => GetProfileUseCase(sl()));
  sl.registerLazySingleton(() => UpdateProfileUseCase(sl()));


sl.registerFactory(() => ProfileCubit(
  getProfileUseCase: sl(),
  updateProfileUseCase: sl(),
));


}
