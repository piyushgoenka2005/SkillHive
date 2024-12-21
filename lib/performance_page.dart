import 'package:flutter/material.dart';

class PerformancePage extends StatelessWidget {
  const PerformancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Performance'),
        backgroundColor: Colors.blue[400],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Performance Overview',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            PerformanceCard(
              title: 'Quizzes Completed',
              value: '8',
              icon: Icons.check_circle_outline,
            ),
            PerformanceCard(
              title: 'Learning Progress',
              value: '75%',
              icon: Icons.school_outlined,
            ),
            PerformanceCard(
              title: 'Overall Score',
              value: '92%',
              icon: Icons.trending_up_outlined,
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Logic to view detailed performance breakdown
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[400],
                ),
                child: Text('View Detailed Report'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PerformanceCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const PerformanceCard({
    required this.title,
    required this.value,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, size: 36, color: Colors.blue[400]),
        title: Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        trailing: Text(
          value,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
