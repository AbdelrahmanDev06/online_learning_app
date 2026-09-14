import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import 'learning_plan_item.dart';

class LearningPlanEntry {
  final String title;
  final int current;
  final int total;

  const LearningPlanEntry({
    required this.title,
    required this.current,
    required this.total,
  });
}

class LearningPlanSection extends StatelessWidget {
  final List<LearningPlanEntry> items;
  final VoidCallback? onMoreTap;

  const LearningPlanSection({super.key, required this.items, this.onMoreTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Learning Plan',
            style: TextStyle(
              color: AppColors.textPrimaryLight,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.darkCard,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                ...items.map(
                  (e) => LearningPlanItem(
                    title: e.title,
                    current: e.current,
                    total: e.total,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: onMoreTap,
                    child: const Text(
                      'more',
                      style: TextStyle(color: AppColors.secondary),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
