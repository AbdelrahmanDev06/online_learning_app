import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';

class FilterChipsRow extends StatelessWidget {
  const FilterChipsRow({
    super.key,
    required this.filters,
    required this.selectedIndex,
    required this.onSelected,
  });

  final List<String> filters;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(filters.length, (index) {
        final bool isSelected = selectedIndex == index;
        return Padding(
          padding: const EdgeInsets.only(right: 10),
          child: GestureDetector(
            onTap: () => onSelected(index),
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.secondary : AppColors.darkCard,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Text(
                filters[index],
                style: TextStyle(
                  color: AppColors.textPrimaryLight,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
