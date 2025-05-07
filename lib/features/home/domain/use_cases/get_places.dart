import 'package:trust_zone/features/home/domain/entities/place_entity.dart';
import 'package:trust_zone/features/home/domain/repo/place_repo.dart';


class GetBranchesByCategoryUseCase {
  final BranchRepository repository;

  GetBranchesByCategoryUseCase(this.repository);

  Future<List<Branch>> call(int categoryId) {
    return repository.getBranchesByCategory(categoryId);
  }
}
