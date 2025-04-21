import 'package:get_it/get_it.dart';
import 'package:trust_zone/features/home/domain/repo/profile_repo_impl.dart';
import 'package:trust_zone/features/home/domain/use_cases/get_profile_use_case.dart';
import 'package:trust_zone/features/home/domain/use_cases/update_profile_use_case.dart';
import 'package:trust_zone/features/home/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:trust_zone/utils/api_service.dart';
import 'package:trust_zone/features/home/data/data_sources/profile_remote_data_source.dart';
import 'package:trust_zone/features/home/data/data_sources/profile_local_data_source.dart';
import 'package:trust_zone/features/home/domain/repo/profile_repo.dart';

final sl = GetIt.instance;

void setupServiceLocator(String token) {
  sl.registerFactoryParam<ApiService, String, void>((token, _) => ApiService(token));

  sl.registerFactoryParam<ProfileRemoteDataSource, String, void>(
    (token, _) => ProfileRemoteDataSourceImpl(sl<ApiService>(param1: token)),
  );

  sl.registerLazySingleton<ProfileLocalDataSource>(() => ProfileLocalDataSourceImpl());

  sl.registerFactoryParam<ProfileRepository, String, void>(
    (token, _) => ProfileRepoImpl(
      remoteDataSource: sl<ProfileRemoteDataSource>(param1: token),
      localDataSource: sl<ProfileLocalDataSource>(),
    ),
  );

  sl.registerFactoryParam<GetProfileUseCase, String, void>(
    (token, _) => GetProfileUseCase(sl<ProfileRepository>(param1: token)),
  );

  sl.registerFactoryParam<UpdateProfileUseCase, String, void>(
    (token, _) => UpdateProfileUseCase(sl<ProfileRepository>(param1: token)),
  );

  sl.registerFactoryParam<ProfileCubit, String, void>((token, _) => ProfileCubit(
        getProfileUseCase: sl<GetProfileUseCase>(param1: token),
        updateProfileUseCase: sl<UpdateProfileUseCase>(param1: token),
      ));
}
