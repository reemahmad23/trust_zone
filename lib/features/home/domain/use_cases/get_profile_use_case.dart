import 'package:dartz/dartz.dart';
import 'package:trust_zone/core/errors/failure.dart';
import 'package:trust_zone/features/home/domain/entities/profile_entity.dart';
import 'package:trust_zone/features/home/domain/repo/profile_repo.dart';

class GetProfileUseCase {
  final ProfileRepository repository;

  GetProfileUseCase(this.repository);

  Future<Either<Failure, ProfileEntity>> call(String token) {
    return repository.getProfile(token);
  }
}
