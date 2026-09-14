import 'package:flutter/material.dart';

/// كارت "Learned today": التسمية + الوقت المتعلم اليوم من إجمالي
/// الهدف + شريط تقدم ملوّن.
class LearnedTodayCard extends StatelessWidget {
  final int minutesLearned;
  final int minutesGoal;

  const LearnedTodayCard({
    super.key,
    required this.minutesLearned,
    required this.minutesGoal,
  });

  @override
  Widget build(BuildContext context) {
    final double progress = minutesGoal == 0 ? 0 : minutesLearned / minutesGoal;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1F35),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Learned today',
            style: TextStyle(color: Color(0xffB8B8D2), fontSize: 14),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                '${minutesLearned}min',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                '/ ${minutesGoal}min',
                style: TextStyle(color: Color(0xffB8B8D2), fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 6,
              backgroundColor: Color(0xffEAEAFF),
              valueColor: const AlwaysStoppedAnimation<Color>(
                Color(0xFFFF6B5B),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
