// lib/login_page.dart
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.jpg',
              width: 100,
              height: 100,
            ),
            SizedBox(height: 32.0),
            Text(
              'Login to your Account',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 32.0),
            TextField(
              decoration: InputDecoration(
                hintText: 'e-mail or phone number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.visibility),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Implement login logic here
                Navigator.pushNamed(context, '/home');
              },
              child: Text('Login'),
            ),
            SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                // Implement forgot password logic here
                Navigator.pushNamed(context, '/forgot-password');
              },
              child: Text('Forgot password?'),
            ),
            SizedBox(height: 32.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSocialIcon('assets/images/google.png', () {}),
                SizedBox(width: 16.0),
                _buildSocialIcon('assets/images/facebook.png', () {}),
                SizedBox(width: 16.0),
                _buildSocialIcon('assets/images/whatsapp.png', () {}),
                SizedBox(width: 16.0),
                _buildSocialIcon('assets/images/instagram.png', () {}),
              ],
            ),
            SizedBox(height: 32.0),
            TextButton(
              onPressed: () {
                // Navigate to the sign-up
                Navigator.pushNamed(context, '/sign-up');
              },
              child: RichText(
                text: TextSpan(
                  text: "Don't have an account? ",
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'Create account',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialIcon(String assetPath, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Image.asset(
        assetPath,
        width: 40,
        height: 40,
      ),
    );
  }
}
