import 'package:flutter/material.dart';
import 'package:trust_zone/features/home/domain/entities/place_entity.dart';

class BranchDetailPage extends StatelessWidget {
  final Branch branch;

  BranchDetailPage({required this.branch});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(branch.place.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Address: ${branch.address}', style: TextStyle(fontSize: 18)),
            Text('Phone: ${branch.phone}', style: TextStyle(fontSize: 18)),
            Text('Website: ${branch.website}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            Text('Place Details: ${branch.place.details}', style: TextStyle(fontSize: 16)),
            // هنا يمكنك إضافة المزيد من التفاصيل حسب الحاجة
          ],
        ),
      ),
    );
  }
}
