import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';

class SearchAppBar extends StatelessWidget {
  const SearchAppBar({super.key, this.onBackTap, this.title = 'Search'});

  final VoidCallback? onBackTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onBackTap ?? () => Navigator.of(context).maybePop(),
          child: Icon(Icons.arrow_back_ios_new,
              color: AppColors.textPrimaryLight, size: 20),
        ),
        Expanded(
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: AppColors.textPrimaryLight,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
      ],
    );
  }
}
