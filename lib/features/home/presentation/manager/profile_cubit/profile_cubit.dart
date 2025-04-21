
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_zone/core/errors/failure.dart';
import 'package:trust_zone/features/home/domain/use_cases/get_profile_use_case.dart';
import 'package:trust_zone/features/home/domain/use_cases/update_profile_use_case.dart';
import 'package:trust_zone/features/home/presentation/manager/profile_cubit/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetProfileUseCase getProfileUseCase;
  final UpdateProfileUseCase updateProfileUseCase;

  ProfileCubit({
    required this.getProfileUseCase,
    required this.updateProfileUseCase,
  }) : super(ProfileInitial());

  Future<void> fetchProfile(String token) async {
    emit(ProfileLoading());

    final result = await getProfileUseCase(token);


    result.fold(
      (failure) => emit(ProfileError(_mapFailureToMessage(failure))),
      (profile) => emit(ProfileLoaded(profile)),
    );
  }

  Future<void> updateProfile(String token,Map<String, dynamic> data) async {
    emit(ProfileLoading());

    final result = await updateProfileUseCase(token, data);

    result.fold(
      (failure) => emit(ProfileError(_mapFailureToMessage(failure))),
      (profile) => emit(ProfileLoaded(profile)),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    if (failure is ServerFailure) return 'Server Error';
    if (failure is CacheFailure) return 'Cache Error';
    return 'Unexpected error';
  }
}
