import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';

class DailyProgressCard extends StatelessWidget {
  final int minutesLearned;
  final int dailyGoalMinutes;
  final VoidCallback? onMyCoursesTap;

  const DailyProgressCard({
    super.key,
    required this.minutesLearned,
    required this.dailyGoalMinutes,
    this.onMyCoursesTap,
  });

  @override
  Widget build(BuildContext context) {
    final double progress = (minutesLearned / dailyGoalMinutes).clamp(0.0, 1.0);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.darkCard,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Learned today',
                style: TextStyle(
                  color: AppColors.textSecondaryLight,
                  fontSize: 13,
                ),
              ),
              GestureDetector(
                onTap: onMyCoursesTap,
                child: const Text(
                  'My courses',
                  style: TextStyle(
                    color: AppColors.secondary,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '${minutesLearned}min',
                  style: const TextStyle(
                    color: AppColors.textPrimaryLight,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: ' / ${dailyGoalMinutes}min',
                  style: const TextStyle(
                    color: AppColors.textMutedLight,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 8,
              backgroundColor: AppColors.dividerLight,
              valueColor: const AlwaysStoppedAnimation<Color>(
                AppColors.secondaryButton,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
