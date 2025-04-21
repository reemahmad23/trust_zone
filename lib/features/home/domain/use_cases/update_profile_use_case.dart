import 'package:dartz/dartz.dart';
import 'package:trust_zone/core/errors/failure.dart';
import 'package:trust_zone/features/home/domain/entities/profile_entity.dart';
import 'package:trust_zone/features/home/domain/repo/profile_repo.dart';


class UpdateProfileUseCase {
  final ProfileRepository repository;

  UpdateProfileUseCase(this.repository);

  Future<Either<Failure, ProfileEntity>> call(String token,Map<String, dynamic> data) {
    return repository.updateProfile(token, data);
  }
}