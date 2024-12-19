// lib/loading_page.dart
import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  // late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _initAnimation();
    _navigateToStartingPage();
  }

  void _initAnimation() {
    _animationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );

    // _slideAnimation = Tween<Offset>(
    //   begin: Offset(0, 1),
    //   end: Offset.zero,
    // ).animate(
    //   CurvedAnimation(
    //     parent: _animationController,
    //     curve: Curves.easeOut,
    //   ),
    // );
  }

  void _navigateToStartingPage() async {
    await Future.delayed(Duration(seconds: 1));
    _animationController.forward().then((_) {
      Navigator.pushNamed(context, '/starting-page');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.jpg',
              width: 100,
              height: 100,
            ),
            SizedBox(height: 16.0),
            Text(
              'SkillHive',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
