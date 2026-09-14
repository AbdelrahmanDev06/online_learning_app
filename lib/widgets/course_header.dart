import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';

class CourseHeader extends StatelessWidget {
  const CourseHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Course',
          style: TextStyle(
            color: AppColors.textPrimaryLight,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.placeholderSurface,
          ),
          child: ClipOval(
            child: Image.asset(
              'assets/images/avatar.png',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  const SizedBox.shrink(),
            ),
          ),
        ),
      ],
    );
  }
}
