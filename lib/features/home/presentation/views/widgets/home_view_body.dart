import 'package:flutter/material.dart';
import 'package:trust_zone/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:trust_zone/features/home/presentation/views/widgets/custom_search_text_field.dart';
import 'package:trust_zone/features/home/presentation/views/widgets/search_category_list_view.dart';
import 'package:trust_zone/utils/app_styles.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return 
      
        Scaffold(
          bottomNavigationBar: CustomBottomNavigationBar(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(),
            
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: CustomSearchTextField(),
                ),
                Text('Categories',
                style: AppStyles.styleBold24,
                ),
            
                Expanded(
                  child: SearchCategoryListView(),
                  ),
              ],
            ),
          ),
        );
  
  }
}



class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
    //padding: EdgeInsets.all(10), // Add padding around the navbar
    decoration: BoxDecoration(
    color: Colors.white, // Background color
    borderRadius: BorderRadius.all(Radius.circular(35)),
    boxShadow: [
    BoxShadow(
      color: Colors.black26, 
      blurRadius: 10, 
      spreadRadius: 2, 
      offset: Offset(0, -3), // Shadow above navbar
    ),
        ],
      ),
        child: BottomNavigationBar(
        selectedItemColor: Color(0xFF1B4965), 
        unselectedItemColor: Color(0xFF1B4965), 
        items: [
    BottomNavigationBarItem(icon: Icon(Icons.home, size: 30), label: ""),
    BottomNavigationBarItem(icon: Icon(Icons.location_on, size: 30), label: ""),
    BottomNavigationBarItem(icon: Icon(Icons.bookmark, size: 30), label: ""),
    BottomNavigationBarItem(icon: Icon(Icons.notifications, size: 30), label: ""),
    BottomNavigationBarItem(icon: Icon(Icons.account_circle, size: 30), label: ""),
        ],
      ),
    );
  }
}
