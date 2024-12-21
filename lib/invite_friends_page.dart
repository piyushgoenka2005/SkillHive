import 'package:flutter/material.dart';

class InviteFriendsPage extends StatelessWidget {
  const InviteFriendsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Invite Friends'),
        backgroundColor: Colors.blue[400],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Invite your friends to join and learn together!',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                // Logic to share app link
              },
              icon: Icon(Icons.share),
              label: Text('Share App'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[400],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
