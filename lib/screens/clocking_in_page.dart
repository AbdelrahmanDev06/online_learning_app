import 'package:flutter/material.dart';
import '../widgets/primary_button.dart';
import '../widgets/stat_column.dart';
import '../widgets/week_day_dot.dart';
import 'my_courses_page.dart';

class ClockingInPage extends StatelessWidget {
  const ClockingInPage({super.key});

  // بيانات تسجيل الأسبوع: الأيام اللي خلصت (1 لـ 4) واللي لسه (5 لـ 7)
  static const int _completedDays = 4;
  static const int _totalWeekDays = 7;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF15162B),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // الكارت نفسه
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    color: const Color(0xFF23243F),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Clocking in!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'GOOD JOB!',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.4),
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                        ),
                      ),

                      const SizedBox(height: 22),

                      // صف: Learned today / Totally hours
                      Row(
                        children: [
                          Expanded(
                            child: StatColumn(
                              label: 'Learned today',
                              value: '46',
                              unit: 'min',
                            ),
                          ),
                          Expanded(
                            child: StatColumn(
                              label: 'Totally hours',
                              value: '468',
                              unit: 'hrs',
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 18),

                      // Totally days
                      const StatColumn(
                        label: 'Totally days',
                        value: '554',
                        unit: 'days',
                      ),

                      const SizedBox(height: 22),

                      // Record of this week
                      Text(
                        'Record of this week',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.5),
                          fontSize: 11,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(_totalWeekDays, (index) {
                          final dayNumber = index + 1;
                          return WeekDayDot(
                            dayNumber: dayNumber,
                            isCompleted: dayNumber <= _completedDays,
                          );
                        }),
                      ),

                      const SizedBox(height: 22),

                      PrimaryButton(
                        label: 'Share',
                        onPressed: () {
                          // هنا تحط لوجيك المشاركة بتاعك
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // زرار الإغلاق الدائري تحت الكارت
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const MyCoursesPage(),
                      ),
                      (route) => false,
                    );
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withValues(alpha: 0.12),
                    ),
                    child: const Icon(
                      Icons.close,
                      color: Colors.white70,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
