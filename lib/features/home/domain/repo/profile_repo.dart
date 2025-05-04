import 'package:trust_zone/features/home/domain/entities/profile_entity.dart';
import 'package:trust_zone/features/home/domain/entities/update_profile_entity.dart';


abstract class ProfileRepo {
  Future<UserProfile> getProfile();
  Future<void> updateProfile(UpdateProfileEntity entity);
}
