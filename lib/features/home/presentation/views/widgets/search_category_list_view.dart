import 'package:flutter/material.dart';
import 'package:trust_zone/utils/app_styles.dart';

class SearchCategoryListView extends StatelessWidget {
  SearchCategoryListView({super.key});

  final List<Map<String, String>> categories = [
    {"title": "Restaurants and Cafes", "image": "assets/images/rastaurant.png"},
    {"title": "Shopping", "image": "assets/images/shopping.png"},
    {
      "title": "Fitness and Sports",
      "image": "assets/images/fitness_and_sports88.png",
    },
    {
      "title": "Government Entities",
      "image": "assets/images/government_entities.png",
    },
    {"title": "Healthcare", "image": "assets/images/healthcare_facilities.png"},
    {"title": "Entertainment", "image": "assets/images/entertainment.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.all(10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return _buildCategoryCard(
                categories[index]["title"]!,
                categories[index]["image"]!,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(String title, String imagePath) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: Stack(
        children: [
          // Brightened image
          ColorFiltered(
            colorFilter: ColorFilter.matrix(<double>[
              1,
              0,
              0,
              0,
              60,
              0,
              1,
              0,
              0,
              60,
              0,
              0,
              1,
              0,
              60,
              0,
              0,
              0,
              1,
              0,
            ]),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),

          // Centered text
          Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
                shadows: [
                  Shadow(
                    blurRadius: 4,
                    color: Colors.black.withOpacity(0.7),
                    offset: Offset(1, 1),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
