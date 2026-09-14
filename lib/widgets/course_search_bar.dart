import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';

class CourseSearchBar extends StatelessWidget {
  const CourseSearchBar({super.key, this.onFilterTap});

  final VoidCallback? onFilterTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.inputFill,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: AppColors.textMutedLight),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              style: TextStyle(color: AppColors.textPrimaryLight),
              decoration: InputDecoration(
                hintText: 'Find Cousre',
                hintStyle: TextStyle(color: AppColors.textMutedLight),
                border: InputBorder.none,
                isCollapsed: true,
              ),
            ),
          ),
          GestureDetector(
            onTap: onFilterTap,
            child: Icon(Icons.tune, color: AppColors.textMutedLight),
          ),
        ],
      ),
    );
  }
}
