import 'package:flutter/material.dart';
import 'package:trust_zone/features/home/presentation/views/widgets/profile_view_body.dart';
import 'package:trust_zone/utils/app_styles.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Profile",
          style: AppStyles.styleBold24,
          
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: const ProfileViewBody(),
    );
  }
}
