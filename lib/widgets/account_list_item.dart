import 'package:flutter/material.dart';

/// صف واحد في قائمة صفحة الأكونت (Favourite, Edit Account, ...)
/// بعنوان على الشمال وسهم صغير على اليمين.
class AccountListItem extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;

  const AccountListItem({super.key, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 23),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            Icon(
              Icons.chevron_right_rounded,
              color: Colors.white.withValues(alpha: 0.4),
              size: 28,
            ),
          ],
        ),
      ),
    );
  }
}
