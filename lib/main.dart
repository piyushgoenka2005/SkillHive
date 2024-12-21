import 'package:app/edit_profile.dart';
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
import 'learnings_page.dart';
import 'quiz_page.dart';
import 'about_page.dart';
import 'invite_friends_page.dart';
import 'performance_page.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Colors.white,
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: Colors.grey.shade900,
    primary: Colors.grey.shade800,
    secondary: Colors.grey.shade700,
  ),
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

  void toggleTheme(bool value) {
    setState(() {
      isDark = value; // Set the theme based on the passed value
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDark ? darkTheme : lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoadingPage(),
        '/starting-page': (context) => const StartingPage(),
        '/login': (context) => const LoginPage(),
        '/edit-profile': (context) => EditProfilePage(isDark: isDark),
        '/sign-up': (context) => const SignUpPage(),
        '/forgot-password': (context) => const ForgotPasswordScreen(),
        '/home': (context) =>
            HomePage(toggleTheme: toggleTheme, isDark: isDark),
        '/profile-page': (context) =>
            ProfilePage(toggleTheme: toggleTheme, isDark: isDark),
        '/explore-page': (context) =>
            ExplorePage(toggleTheme: toggleTheme, isDark: isDark),
        '/bookmark-page': (context) =>
            BookmarksPage(toggleTheme: toggleTheme, isDark: isDark),
        '/learnings': (context) => const LearningsPage(),
        '/quiz': (context) => const QuizPage(),
        '/about': (context) => const AboutPage(),
        '/invite-friends': (context) => const InviteFriendsPage(),
        '/performance': (context) => const PerformancePage(),
      },
    );
  }
}
