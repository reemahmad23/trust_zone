import 'package:trust_zone/features/home/domain/entities/category_entity.dart';
import 'package:trust_zone/features/home/domain/repo/category_repo.dart';


class GetCategoriesUseCase {
  final CategoryRepository repository;

  GetCategoriesUseCase(this.repository);

  Future<List<Category>> call() async {
    return await repository.getCategories();
  }
}
