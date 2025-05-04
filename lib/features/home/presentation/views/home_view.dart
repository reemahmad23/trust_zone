import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trust_zone/features/home/presentation/views/widgets/custom_menu_drawer.dart';

class HomeView extends StatelessWidget {
  final List<Map<String, String>> categories = [
    {"title": "Restaurants and Cafes", "image": "assets/images/rastaurant.png"},
    {"title": "Shopping", "image": "assets/images/shopping.png"},
    {"title": "Fitness and Sports", "image": "assets/images/fitness_and_sports.png"},
    {"title": "Government Entities", "image": "assets/images/government_entities.png"},
    {"title": "Healthcare Facilities", "image": "assets/images/healthcare_facilities.png"},
    {"title": "Entertainment", "image": "assets/images/entertainment.png"},
  ];

    HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () {
              context.push('/profile_view');
            },
            child: CircleAvatar(
              child: Icon(Icons.person),
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(12),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.filter_alt),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12),
              child: Align(
              alignment: AlignmentDirectional.topStart, // يتوافق مع اللغة تلقائيًا
              child: Text(
              "Categories",
              style: TextStyle(
                color: Color(0xFF1B4965),
                fontSize: 24, fontWeight: FontWeight.bold),
            ),
              ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(15),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16, 
                crossAxisSpacing: 16,
                childAspectRatio: 1,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    context.push('/places-view');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: AssetImage(categories[index]['image']!),
                        fit: BoxFit.cover,
                        
                      ),
                    ),
                    child: Center(
                      child: Text(
                        categories[index]['title']!,
                        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,     // لون الأيقونة المختارة
        unselectedItemColor: Color(0xFF1B4965),
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.save), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.location_on), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.smart_toy), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: ''),
        ],
      ),
    );
  }
}
