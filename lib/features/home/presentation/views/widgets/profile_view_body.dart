import 'package:flutter/material.dart';
import 'package:trust_zone/utils/app_images.dart';
import 'package:trust_zone/utils/app_styles.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
      child: Column(
        children: [
          CircleAvatar(
            radius: 80,
            backgroundImage: Image.network(Assets.imagesProfile1).image, // Change to your image path
          ),
          const SizedBox(height: 30),

          
          _buildProfileOption(Icons.person_outline, "Edit profile", () {}),
          const SizedBox(height: 20),
          _buildProfileOption(Icons.my_library_books, "My Bookings", () {}),
          const SizedBox(height: 20),
          _buildProfileOption(Icons.logout, "Log out", () {}),
        ],
      ),
    );
  }

  Widget _buildProfileOption(IconData icon, String text, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          decoration: BoxDecoration(
            color: Color(0xFFDADADA),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Icon(icon, color: Colors.black54),
              const SizedBox(width: 25),
              Text(
                text,
                style: AppStyles.styleRegular16,
                
              ),
            ],
          ),
        ),
      ),
    );
  }
}
