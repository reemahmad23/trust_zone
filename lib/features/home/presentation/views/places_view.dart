import 'package:flutter/material.dart';

class PlacesView extends StatelessWidget {
  final List<Map<String, String>> restaurants = [
    {"name": "tikiat Younes", "access": "partially accessible", "image": ""},
    {"name": "Arkan", "access": "partially accessible", "image": ""},
    {"name": "Restaurant name", "access": "partially accessible", "image": ""},
    {"name": "Restaurant name", "access": "partially accessible", "image": ""},
    {"name": "Restaurant name", "access": "fully accessible", "image": ""},
  ];

    PlacesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Restaurants")),
      body: ListView.builder(
        itemCount: restaurants.length,
        itemBuilder: (context, index) {
          final restaurant = restaurants[index];
          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              leading: restaurant['image']!.isNotEmpty
                  ? Image.asset(restaurant['image']!)
                  : CircleAvatar(backgroundColor: Colors.blueGrey),
              title: Text(restaurant['name']!),
              subtitle: Text(restaurant['access']!),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("4.7"),
                  Icon(Icons.star, color: Colors.amber, size: 20),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
