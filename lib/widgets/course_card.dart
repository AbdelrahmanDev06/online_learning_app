import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';

class CourseModel {
  const CourseModel({
    required this.title,
    required this.author,
    required this.price,
    required this.duration,
    required this.imagePath,
  });

  final String title;
  final String author;
  final String price;
  final String duration;
  final String imagePath;
}

class CourseCard extends StatelessWidget {
  const CourseCard({super.key, required this.course, this.onTap});

  final CourseModel course;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.darkCard,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.asset(
                course.imagePath,
                width: 64,
                height: 64,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: 64,
                  height: 64,
                  color: AppColors.placeholderSurface,
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.title,
                    style: TextStyle(
                      color: AppColors.textPrimaryLight,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(Icons.person,
                          size: 14, color: AppColors.textMutedLight),
                      const SizedBox(width: 4),
                      Text(
                        course.author,
                        style: TextStyle(
                          color: AppColors.textMutedLight,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Text(
                        course.price,
                        style: TextStyle(
                          color: AppColors.secondary,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        course.duration,
                        style: TextStyle(
                          color: AppColors.secondaryButton,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
