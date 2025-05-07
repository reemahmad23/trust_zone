import 'package:trust_zone/features/home/domain/entities/place_entity.dart';
import 'package:trust_zone/features/home/domain/repo/place_repo.dart';
import 'package:trust_zone/utils/profile_api_service.dart';



class BranchRepositoryImpl implements BranchRepository {
  final ProfileApiService apiService;

  BranchRepositoryImpl({required this.apiService});

  @override
  Future<List<Branch>> getBranchesByCategory(int categoryId) async {
    final branchModels = await apiService.getBranchesByCategory(categoryId);

    return branchModels.map((model) {
      return Branch(
        id: model.id,
        address: model.address,
        website: model.website,
        phone: model.phone,
        createdAt: model.createdAt,
        place: Place(
          name: model.place.name,
          categoryId: model.place.categoryId,
          latitude: model.place.latitude,
          longitude: model.place.longitude,
          details: model.place.details,
          features: model.place.features
              .map((f) => Feature(
                    featureId: f.featureId,
                    featureName: f.featureName,
                    description: f.description,
                  ))
              .toList(),
        ),
      );
    }).toList();
  }
}
