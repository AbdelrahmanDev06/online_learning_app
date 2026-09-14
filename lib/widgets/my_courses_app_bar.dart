import 'package:flutter/material.dart';
import '../screens/clocking_in_page.dart';

/// شريط العنوان بتاع صفحة My Courses: سهم رجوع على الشمال
/// والعنوان في النص بالظبط.
class MyCoursesAppBar extends StatelessWidget {
  const MyCoursesAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ClockingInPage(),
                  ),
                );
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
                size: 20,
                fontWeight: .bold,
              ),
            ),
          ),
          const Text(
            'My courses',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
