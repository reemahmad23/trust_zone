import 'package:trust_zone/features/home/domain/entities/place_entity.dart';


abstract class BranchRepository {
  Future<List<Branch>> getBranchesByCategory(int categoryId);
}
