import 'package:flutter/material.dart';

class ChatViewBody extends StatelessWidget {
  const ChatViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Search Field
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
              fillColor: Colors.grey[200],
            ),
          ),
        ),

        // Divider or Label after search
        SizedBox(height: 8),

        // Message List
        Expanded(
          child: ListView.builder(
            itemCount: 8,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(),
                title: Text("name"),
                subtitle: Text("message details"),
                trailing: Text(_getTimeForIndex(index)),
              );
            },
          ),
        ),
      ],
    );
  }

  String _getTimeForIndex(int index) {
    final times = [
      '1:20 PM',
      '11:44 AM',
      '11:24 AM',
      '8:14 AM',
      '7:30 AM',
      '7:20 AM',
      '6:44 AM',
      '6:24 AM',
    ];
    return times[index];
  }
}
