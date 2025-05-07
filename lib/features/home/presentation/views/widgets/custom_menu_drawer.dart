import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xFF62B6CB),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DrawerHeader(
            child: Row(
              children: [
                CircleAvatar(
                    child: IconButton(
                    icon: Icon(Icons.person),
                    onPressed: () {
                    context.push('/profile-view');
                  },
                ),
              ),
                SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('username', style: TextStyle(color: Colors.white)),
                    Text('rrrrr@gmail.com', style: TextStyle(color: Colors.white70)),
                  ],
                ),
              ],
            ),
          ),
          ListTile(leading: Icon(Icons.settings), title: Text('Settings')),
          ListTile(leading: Icon(Icons.notifications), title: Text('Notifications')),
          ListTile(leading: Icon(Icons.event), title: Text('Events')),
          SizedBox(height: 220),
          ListTile(leading: Icon(Icons.help), title: Text('Help')),
          ListTile(leading: Icon(Icons.logout), title: Text('Log out')),
        ],
      ),
    );
  }
}
