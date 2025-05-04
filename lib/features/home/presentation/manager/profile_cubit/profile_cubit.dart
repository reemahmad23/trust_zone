import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:trust_zone/features/home/domain/entities/profile_entity.dart';
import 'package:trust_zone/features/home/domain/entities/update_profile_entity.dart';
import 'package:trust_zone/features/home/domain/use_cases/get_profile_use_case.dart';
import 'package:trust_zone/features/home/domain/use_cases/update_profile_use_case.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetProfileUseCase getProfileUseCase;
  final UpdateProfileUseCase updateProfileUseCase;

  ProfileCubit({
    required this.getProfileUseCase,
    required this.updateProfileUseCase,
  }) : super(ProfileInitial());

  UserProfile? userProfile;

  Future<void> fetchUserProfile() async {
    emit(ProfileLoading());
    try {
      userProfile = await getProfileUseCase();
      emit(ProfileLoaded(userProfile!));
    } catch (e) {
      emit(ProfileError("فشل تحميل البيانات: ${e.toString()}"));
    }
  }

  Future<void> updateUserProfile(UpdateProfileEntity entity) async {
    emit(ProfileUpdating());
    try {
      await updateProfileUseCase(entity);
      userProfile = await getProfileUseCase(); // reload data
      emit(ProfileUpdated(userProfile!));
    } catch (e) {
      emit(ProfileError("فشل التعديل: ${e.toString()}"));
    }
  }
}
