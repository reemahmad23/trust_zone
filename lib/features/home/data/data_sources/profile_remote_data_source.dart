import 'package:hive/hive.dart';
import 'package:trust_zone/features/home/data/models/profile_model/profile_model.dart';
import 'package:trust_zone/features/home/domain/entities/profile_entity.dart';
import 'package:trust_zone/utils/api_service.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileModel> getProfile();
  Future<ProfileModel> updateProfile(Map<String, dynamic> data);
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final ApiService apiService;

  ProfileRemoteDataSourceImpl(this.apiService);

  @override
  Future<ProfileModel> getProfile() async {

    var box = await Hive.openBox("profileBox");
    if (box.containsKey('profile')) {
    return box.get('profile') as ProfileModel;
    }
    final data = await apiService.get(endpoint: '/api/UserProfile');
    ProfileModel profile = ProfileModel.fromJson(data);

    await box.put('profile', profile);
    return profile;
  }

  @override
  Future<ProfileModel> updateProfile(Map<String, dynamic> data) async {
    final result = await apiService.put(
      endpoint: '/api/UserProfile',
      body: data,
    );
    ProfileModel updatedProfile = ProfileModel.fromJson(result);
    var box = await Hive.openBox("profileBox");
    await box.put('profile', updatedProfile);

    return updatedProfile;
  }
}