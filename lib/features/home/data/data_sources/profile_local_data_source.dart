import 'package:hive/hive.dart';
import 'package:trust_zone/features/home/data/models/profile_model/profile_model.dart';

abstract class ProfileLocalDataSource {
  Future<void> cacheProfile(ProfileModel profile);
  Future<ProfileModel?> getCachedProfile();
}

class ProfileLocalDataSourceImpl implements ProfileLocalDataSource {
  static const String boxName = 'profileBox';
  static const String key = 'cachedProfile';

  @override
  Future<void> cacheProfile(ProfileModel profile) async {
    final box = await Hive.openBox<ProfileModel>(boxName);
    await box.put(key, profile);
    await box.close(); 
  }

  @override
  Future<ProfileModel?> getCachedProfile() async {
    final box = await Hive.openBox<ProfileModel>(boxName);
    final profile = box.get(key);
    await box.close();
    return profile;
  }
}
