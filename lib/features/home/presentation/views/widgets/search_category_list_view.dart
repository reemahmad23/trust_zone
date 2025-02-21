
import 'package:flutter/material.dart';
import 'package:trust_zone/utils/app_styles.dart';

class SearchCategoryListView extends StatelessWidget {
  SearchCategoryListView({super.key});

final List<Map<String, dynamic>> categories = [
    {"title": "Restaurants and Cafes", "color": Color(0xFF5FA8D3)},
    {"title": "Shopping", "color": Color(0xFF1B4965)},
    {"title": "Fitness and Sports", "color": Color(0xFF1B4965)},
    {"title": "Government Entities", "color": Color(0xFF62B6CB)},
    {"title": "Healthcare", "color": Color(0xFF62B6CB)},
    {"title": "Entertainment", "color": Color(0xFF5FA8D3)},
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
    child: Column(
    children: [
      // Other widgets
      GridView.builder(
        shrinkWrap: true, // Add this
        physics: NeverScrollableScrollPhysics(), // Disable nested scrolling
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return _buildCategoryCard(
            categories[index]["title"],
            categories[index]["color"],
          );
        },
      ),
    ],
  ),

    
    );
}




  Widget _buildCategoryCard(String title, Color? color) {
    return Container(
      decoration: BoxDecoration(
        color: color ?? Colors.grey,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}