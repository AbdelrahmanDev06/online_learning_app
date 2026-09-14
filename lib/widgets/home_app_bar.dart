import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';

class HomeAppBar extends StatelessWidget {
  final String userName;
  final String? avatarAssetPath;
  final String? avatarUrl;

  const HomeAppBar({
    super.key,
    required this.userName,
    this.avatarAssetPath,
    this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi, $userName',
                  style: const TextStyle(
                    color: AppColors.textPrimaryLight,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  "Let's start learning",
                  style: TextStyle(
                    color: AppColors.textSecondaryLight,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          CircleAvatar(
            radius: 26,
            backgroundColor: AppColors.surfaceWhite,
            backgroundImage: avatarAssetPath != null
                ? AssetImage(avatarAssetPath!)
                : (avatarUrl != null
                      ? NetworkImage(avatarUrl!) as ImageProvider
                      : null),
            child: (avatarAssetPath == null && avatarUrl == null)
                ? Icon(
                    Icons.person,
                    color: AppColors.textSecondaryLight,
                    size: 32,
                  )
                : null,
          ),
        ],
      ),
    );
  }
}
