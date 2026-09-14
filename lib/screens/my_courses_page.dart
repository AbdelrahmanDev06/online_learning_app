import 'package:flutter/material.dart';
import '../widgets/my_courses_app_bar.dart';
import '../widgets/learned_today_card.dart';
import '../widgets/courses_grid.dart';
import '../widgets/bottom_nav_bar.dart';
import 'account_page.dart';

class MyCoursesPage extends StatelessWidget {
  const MyCoursesPage({super.key});

  void _onTabSelected(BuildContext context, NavTab tab) {
    if (tab == NavTab.course) return; // إحنا أصلاً فيها
    if (tab == NavTab.account) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const AccountPage()),
      );
    }
    // Home, Search, Message: لسه مفيش صفحات ليهم
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF15162B),
      body: SafeArea(
        child: Column(
          children: [
            const MyCoursesAppBar(),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    SizedBox(height: 8),
                    LearnedTodayCard(minutesLearned: 46, minutesGoal: 60),
                    SizedBox(height: 20),
                    CoursesGrid(),
                    SizedBox(height: 24),
                  ],
                ),
              ),
            ),

            BottomNavBar(
              activeTab: NavTab.course,
              onTabSelected: (tab) => _onTabSelected(context, tab),
            ),
          ],
        ),
      ),
    );
  }
}
