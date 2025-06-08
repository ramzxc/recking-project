// lib/main.dart
import 'package:flutter/material.dart';
import 'screens/community_page.dart';
import 'screens/home_page.dart';
import 'screens/mbti_page.dart';
import 'screens/course_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recking App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/community': (context) => const CommunityHomePage(), // 커뮤니티
        '/course': (context) => CourseDetailPage(),
        '/mbti': (context) => const MbtiPage(),
      },
    );
  }
}