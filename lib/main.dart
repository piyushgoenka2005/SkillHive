import 'package:flutter/material.dart';
import 'package:app/bookmarks_page.dart';
import 'package:app/explore_page.dart';
import 'package:app/forgot_password.dart';
import 'package:app/loading_page.dart';
import 'package:app/login_page.dart';
import 'package:app/starting_page.dart';
import 'package:app/home.dart';
import 'package:app/profile_page.dart';
import 'package:app/sign_up_page.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Colors.white,
    primary: Colors.grey.shade300,
    secondary: Colors.grey.shade200,
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: Colors.grey.shade900,
    primary: Colors.grey.shade800,
    secondary: Colors.grey.shade700,
  ), // ColorScheme.dark
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = false; // Default theme is light

  // Function to toggle theme based on the button press in HomePage
  void toggleTheme(bool value) {
    setState(() {
      isDark =
          value; // Set isDark to the value received from HomePage button press
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDark
          ? darkTheme
          : lightTheme, // Use the value of isDark to decide theme
      title: 'SkillHive',
      initialRoute: '/loading-page',
      routes: {
        '/loading-page': (context) => LoadingPage(),
        '/starting-page': (context) => StartingPage(),
        '/home': (context) =>
            HomePage(toggleTheme: toggleTheme), // Pass toggleTheme to HomePage
        '/sign-up': (context) => SignUpPage(),
        '/login': (context) => LoginPage(),
        '/profile-page': (context) => ProfilePage(),
        '/forgot-password': (context) => ForgotPasswordScreen(),
        '/explore-page': (context) => ExplorePage(),
        '/bookmark-page': (context) => BookmarksPage(),
      },
    );
  }
}
