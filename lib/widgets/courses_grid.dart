import 'package:flutter/material.dart';
import 'course_card.dart';

/// ترتيب كروت الكورسات: اتنين جنب بعض في صف، وواحد لوحده
/// بنص العرض في الصف اللي بعده - زي التصميم بالظبط.
class CoursesGrid extends StatelessWidget {
  const CoursesGrid({super.key});

  // طول ثابت لكل كارت كورس
  static const double _cardHeight = 192;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // عرض كارت "Visual Design" (نص عرض الصف بعد خصم الـ padding والفراغ بينهم)
    final halfCardWidth = (screenWidth - 24 * 2 - 16) / 2;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SizedBox(
                height: _cardHeight,
                child: CourseCard(
                  title: 'Product\nDesign v1.0',
                  completed: 14,
                  total: 24,
                  accentColor: const Color(0xFFE94F86),
                  onPlay: () {},
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: SizedBox(
                height: _cardHeight,
                child: CourseCard(
                  title: 'Java\nDevelopment',
                  completed: 12,
                  total: 18,
                  accentColor: const Color(0xFF4C63F2),
                  onPlay: () {},
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Align(
          alignment: Alignment.centerLeft,
          child: SizedBox(
            width: halfCardWidth,
            height: _cardHeight,
            child: CourseCard(
              title: 'Visual Design',
              completed: 10,
              total: 16,
              accentColor: const Color(0xFF2FBF9F),
              onPlay: () {},
            ),
          ),
        ),
      ],
    );
  }
}
