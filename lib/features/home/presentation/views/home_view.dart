import 'package:flutter/material.dart';
import 'package:trust_zone/features/home/presentation/views/widgets/custom_menu_drawer.dart';
import 'package:trust_zone/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:trust_zone/utils/app_images.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
      elevation: 0,
      backgroundColor: const Color(0xFFFAFAFA),
      leading: IconButton(
      onPressed: () {
      scaffoldKey.currentState!.openDrawer();
    },
    icon: const Icon(Icons.menu),
  ),
  actions: [
    Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: IconButton(
        icon: Image.network(Assets.imagesProfile1),
        onPressed: () {
          // Add profile action here
        },
      ),
    ),
  ],
),
      drawer: const CustomMenuDrawer(),

      body: GestureDetector(
        onTap: () {
          if (scaffoldKey.currentState!.isDrawerOpen) {
            Navigator.of(context).pop();
          }
        },
        child: const HomeViewBody(),
      ),

      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
