import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trust_zone/features/home/presentation/views/edit_profile_view.dart';
import 'package:trust_zone/features/home/presentation/views/widgets/profile_button.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Profile"),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const CircleAvatar(
            radius: 60,
            backgroundColor: Colors.blueAccent,
            child: Icon(Icons.person, size: 80, color: Colors.white),
          ),
          const SizedBox(height: 30),
          ProfileButton(
            icon: Icons.person_outline,
            label: "Edit profile",
            onTap: () {
                context.push('/edit-Profile');
            },
          ),
          ProfileButton(
            icon: Icons.calendar_today_outlined,
            label: "My Favorites",
            onTap: () {
              // Navigate to bookings page
            },
          ),
          ProfileButton(
            icon: Icons.logout,
            label: "Log out",
            onTap: () {
              // Handle log out
            },
          ),
        ],
      ),
    );
  }
}
