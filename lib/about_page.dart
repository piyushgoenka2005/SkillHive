import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
        backgroundColor: Colors.blue[400],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About the App',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'This app is designed to provide gig workers with tailored, AI-driven learning opportunities. '
              'It scans user emails (with permission) for insights on job history, client feedback, and training materials. '
              'Based on this data and a quick user check-in, it recommends short, practical learning modules that are easy to consume and fit their schedules. '
              'Our goal is to help gig workers upskill efficiently and achieve their career ambitions.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Features:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              '- AI-based recommendations tailored to current skill gaps and career goals\n'
              '- Content in preferred language\n'
              '- Short, easy-to-follow tutorials, quizzes, and videos\n'
              '- Adaptive learning that evolves with user progress',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
