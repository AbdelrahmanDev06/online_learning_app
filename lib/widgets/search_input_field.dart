import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';

class SearchInputField extends StatelessWidget {
  const SearchInputField({
    super.key,
    required this.controller,
    this.onChanged,
    this.onClear,
    this.onFilterTap,
    this.hintText = 'Find Cousre',
  });

  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onClear;
  final VoidCallback? onFilterTap;
  final String hintText;

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
              controller: controller,
              onChanged: onChanged,
              style: TextStyle(color: AppColors.textPrimaryLight),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(color: AppColors.textMutedLight),
                border: InputBorder.none,
                isCollapsed: true,
              ),
            ),
          ),
          if (controller.text.isNotEmpty)
            GestureDetector(
              onTap: onClear,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.textMutedLight,
                ),
                child: Icon(Icons.close,
                    size: 14, color: AppColors.primary),
              ),
            ),
          const SizedBox(width: 12),
          GestureDetector(
            onTap: onFilterTap,
            child: Icon(Icons.tune, color: AppColors.textMutedLight),
          ),
        ],
      ),
    );
  }
}
