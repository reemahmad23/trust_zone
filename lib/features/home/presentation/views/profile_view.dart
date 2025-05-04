import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:trust_zone/features/home/domain/entities/profile_entity.dart';
import 'package:trust_zone/features/home/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:trust_zone/features/home/presentation/views/widgets/custom_error_widget.dart';
import 'package:trust_zone/utils/set_up_service_locator.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
    create: (context) => sl<ProfileCubit>()..fetchUserProfile(),

      child: Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
          centerTitle: true,
          title: const Text('Profile'),
        ),
        body: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProfileError) {
              return CustomErrorWidget(message: state.message);
            } else if (state is ProfileLoaded) {
              final profile = state.profile;

              return Column(
                children: [
                  const SizedBox(height: 20),
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: profile.profilePictureUrl != null
                        ? NetworkImage(profile.profilePictureUrl!)
                        : null,
                    child: profile.profilePictureUrl == null ? const Icon(Icons.person, size: 50) : null,
                  ),
                  const SizedBox(height: 20),
                  ProfileItem(icon: Icons.person, text: profile.userName ?? 'No name'),
                  ProfileItem(icon: Icons.email, text: profile.email ?? 'No email'),
                  ProfileItem(icon: Icons.accessibility, text: profile.age?.toString() ?? 'No age'),
                  ProfileItem(icon: Icons.book_online, text: 'My Bookings'), // مثال placeholder
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () async {
                        final updatedProfile = await context.push('/editProfile');
                        if (updatedProfile != null && updatedProfile is UserProfile) {
                        context.read<ProfileCubit>().emit(ProfileLoaded(updatedProfile));
                          }
                      },
                        icon: const Icon(Icons.edit),
                        label: const Text('Edit'),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            // تنفيذ عملية تسجيل الخروج
                          },
                          icon: const Icon(Icons.logout),
                          label: const Text('Log Out'),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              );
            } else {
              return const Center(child: Text('Unexpected state'));
            }
          },
        ),
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const ProfileItem({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 10),
          Expanded(
            child: Text(text, style: const TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}
