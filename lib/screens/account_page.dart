import 'package:flutter/material.dart';
import '../widgets/profile_avatar.dart';
import '../widgets/account_menu_list.dart';
import '../widgets/bottom_nav_bar.dart';
import 'my_courses_page.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  void _onTabSelected(BuildContext context, NavTab tab) {
    if (tab == NavTab.account) return; // إحنا أصلاً فيها
    if (tab == NavTab.course) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const MyCoursesPage()),
      );
    }
    // Home, Search, Message: لسه مفيش صفحات ليهم
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F1F39),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    SizedBox(height: 12),
                    Text(
                      'Account',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 22),
                    ProfileAvatar(),
                    AccountMenuList(),
                    // SizedBox(height: 24),
                  ],
                ),
              ),
            ),

            BottomNavBar(
              activeTab: NavTab.account,
              onTabSelected: (tab) => _onTabSelected(context, tab),
            ),
          ],
        ),
      ),
    );
  }
}
