import 'package:flutter/material.dart';
import 'package:trust_zone/utils/app_images.dart';
import 'package:trust_zone/utils/app_styles.dart';

class CustomMenuDrawer extends StatelessWidget {
  const CustomMenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color(0xFF62B6CB),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DrawerHeader(
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: Image.network(Assets.imagesProfile1).image,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Roaa Emad", style: AppStyles.styleBold16),
                      Text("roaae@gmail.com", style: AppStyles.styleSemiBold16),
                    ],
                  ),
                ],
              ),
            ),
            _buildDrawerItem(Icons.settings, "Settings"),
            _buildDrawerItem(Icons.notifications, "Notifications"),
            _buildDrawerItem(Icons.event, "Events"),

            const Spacer(),
            Divider(color: Colors.white30),
            _buildDrawerItem(Icons.help_outline, "Help"),
            _buildDrawerItem(Icons.logout, "Log out"),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Icon(icon, color: Colors.black, size: 24),
          const SizedBox(width: 15),
          Text(
            title,
            style: const TextStyle(color: Colors.black, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
