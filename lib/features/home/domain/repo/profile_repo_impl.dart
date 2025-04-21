import 'package:dartz/dartz.dart';
import 'package:trust_zone/core/errors/failure.dart';
import 'package:trust_zone/features/home/data/data_sources/profile_local_data_source.dart';
import 'package:trust_zone/features/home/data/data_sources/profile_remote_data_source.dart';
import 'package:trust_zone/features/home/data/models/profile_model/profile_model.dart';
import 'package:trust_zone/features/home/domain/repo/profile_repo.dart';

class ProfileRepoImpl  extends ProfileRepository{
  final ProfileRemoteDataSource remoteDataSource;
  final ProfileLocalDataSource localDataSource;

  ProfileRepoImpl({required this.remoteDataSource, required this.localDataSource});
  
  
  @override
  Future<Either<Failure, ProfileModel>> getProfile(String token) async {
    try {
      final profile = await remoteDataSource.getProfile();
      await localDataSource.cacheProfile(profile);
      return Right(profile);
    } catch (e) {
      try {
        final cachedProfile = await localDataSource.getCachedProfile();
        if (cachedProfile != null) {
          return Right(cachedProfile);
        } else {
          return Left(CacheFailure("No cached data available"));
        }
      } catch (e) {
        return Left(CacheFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, ProfileModel>> updateProfile(String token,Map<String, dynamic> data) async {
    try {
      final profile = await remoteDataSource.updateProfile(data);
      await localDataSource.cacheProfile(profile);
      return Right(profile);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}