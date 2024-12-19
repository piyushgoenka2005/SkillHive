import 'package:app/bookmarks_page.dart';
import 'package:app/explore_page.dart';
import 'package:app/forgot_password.dart';
import 'package:app/loading_page.dart';
import 'package:app/login_page.dart';
import 'package:app/starting_page.dart';
import 'package:app/home.dart';
import 'package:app/profile_page.dart';
import 'package:app/sign_up_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Skill Hive',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: HomePage(),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SkillHive',
      initialRoute: '/loading-page',
      routes: {
        '/loading-page': (context) => LoadingPage(),
        '/starting-page': (context) => StartingPage(),
        '/home': (context) => HomePage(),
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
