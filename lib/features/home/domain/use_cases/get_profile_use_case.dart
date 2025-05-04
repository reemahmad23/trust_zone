
import 'package:trust_zone/features/home/domain/entities/profile_entity.dart';
import 'package:trust_zone/features/home/domain/repo/profile_repo.dart';

class GetProfileUseCase {
  final ProfileRepo repo;

  GetProfileUseCase(this.repo);

  Future<UserProfile> call() async {
    return await repo.getProfile();
  }
}
