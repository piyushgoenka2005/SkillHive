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
    //primary: Colors.grey.shade300,
    //secondary: Colors.grey.shade200,
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
  bool isDark = false;

  void toggleTheme() {
    setState(() {
      isDark = !isDark; // Simply toggle between true/false
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDark ? darkTheme : lightTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoadingPage(),
        '/starting-page': (context) => const StartingPage(),
        '/login': (context) => const LoginPage(),
        '/sign-up': (context) => const SignUpPage(),
        '/forgot-password': (context) => const ForgotPasswordScreen(),
        '/home': (context) => HomePage(toggleTheme: toggleTheme, isDark: isDark),
        '/profile-page': (context) => ProfilePage(toggleTheme: toggleTheme, isDark: isDark),
        '/explore-page': (context) => const ExplorePage(),
        '/bookmark-page': (context) => const BookmarksPage(),
      },
    );
  }
}
