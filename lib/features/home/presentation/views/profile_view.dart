import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_zone/features/home/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:trust_zone/features/home/presentation/manager/profile_cubit/profile_state.dart';
import 'package:trust_zone/utils/set_up_service_locator.dart';
import 'package:trust_zone/features/home/presentation/views/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  final String token;
  const ProfileView({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileCubit(
        getProfileUseCase: sl(param1: token),
        updateProfileUseCase: sl(param1: token),
      )..fetchProfile(token),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Profile'),
        ),
        body: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProfileLoaded) {
              final profile = state.profile;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Name: ${profile.name}', style: const TextStyle(fontSize: 18)),
                        const SizedBox(height: 10),
                        Text('Email: ${profile.email}', style: const TextStyle(fontSize: 18)),
                        const SizedBox(height: 10),
                        Text('Image: ${profile.imageUrl ?? "No image"}', style: const TextStyle(fontSize: 18)),
                      ],
                    ),
                  ),
                  const Expanded(child: ProfileViewBody()),
                ],
              );
            } else if (state is ProfileError) {
              return Center(child: Text('Error: ${state.message}'));
            } else {
              return const Center(child: Text('No Data'));
            }
          },
        ),
      ),
    );
  }
}
