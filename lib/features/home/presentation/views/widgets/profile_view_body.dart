import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_zone/features/home/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:trust_zone/features/home/presentation/manager/profile_cubit/profile_state.dart';
import 'package:trust_zone/utils/app_styles.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProfileLoaded) {
          final profile = state.profile;

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundImage: profile.imageUrl != null
                      ? NetworkImage(profile.imageUrl!)
                      : const AssetImage('assets/images/default_profile.png') as ImageProvider,
                ),
                const SizedBox(height: 20),
                Text(profile.name, style: AppStyles.styleBold24),
                const SizedBox(height: 10),
                Text(profile.email, style: AppStyles.styleRegular16),
                const SizedBox(height: 10),
                if (profile.disabilityTypes != null)
                  Text(
                    'Disabilities: ${profile.disabilityTypes!.map((e) => e.name).join(', ')}',
                    style: AppStyles.styleRegular16,
                    textAlign: TextAlign.center,
                  ),
                const SizedBox(height: 30),
                ProfileOption(icon: Icons.person_outline, text: "Edit profile", onTap: () {}),
                const SizedBox(height: 20),
                ProfileOption(icon: Icons.my_library_books, text: "My Bookings", onTap: () {}),
                const SizedBox(height: 20),
                ProfileOption(icon: Icons.logout, text: "Log out", onTap: () {}),
              ],
            ),
          );
        } else if (state is ProfileError) {
          return Center(child: Text("Error: ${state.message}"));
        } else {
          return const Center(child: Text("No profile data available"));
        }
      },
    );
  }
}

class ProfileOption extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const ProfileOption({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: BoxDecoration(
          color: const Color(0xFFDADADA),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.black54),
            const SizedBox(width: 25),
            Text(text, style: AppStyles.styleRegular16),
          ],
        ),
      ),
    );
  }
}
