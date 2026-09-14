import 'package:flutter/material.dart';
import 'package:online_learning_app/core/theme/app_colors.dart';

class PageIndicatorDots extends StatelessWidget {
  final int pageCount;
  final int currentIndex;

  const PageIndicatorDots({
    super.key,
    required this.pageCount,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(pageCount, (index) {
        final bool isActive = index == currentIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: isActive ? 22 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: isActive
                ? AppColors.secondary
                : AppColors.secondary.withOpacity(0.5),
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
}
