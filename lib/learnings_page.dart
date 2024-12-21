import 'package:flutter/material.dart';

class LearningsPage extends StatelessWidget {
  const LearningsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learnings'),
        backgroundColor: Colors.blue[400],
      ),
      body: Center(
        child: Text(
          'Explore curated learning modules and tutorials to boost your skills.',
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
