import 'package:flutter/material.dart';
import 'home/home_screen.dart';
import 'course_screen.dart';
import 'search_screen.dart';
import 'message_screen.dart';
import 'account_screen.dart';
import '../widgets/custom_bottom_nav_bar.dart';

/// Root screen that owns the bottom navigation and swaps between
/// the team's 5 tab screens. Each teammate's screen is wired in here
/// once it's ready — the placeholders below just get swapped out.
class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int _currentIndex = 0;

  // Order must match CustomBottomNavBar items:
  // 0 Home, 1 Course, 2 Search, 3 Message, 4 Account
  final List<Widget> _screens = const [
    HomeScreen(),
    CourseScreen(),
    SearchScreen(),
    MessageScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}
