import 'package:flutter/material.dart';

class LearningPlanItem extends StatelessWidget {
  final String title;
  final int current;
  final int total;
  final VoidCallback? onTap;

  const LearningPlanItem({
    super.key,
    required this.title,
    required this.current,
    required this.total,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final double progress = total == 0 ? 0 : (current / total).clamp(0.0, 1.0);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            SizedBox(
              width: 22,
              height: 22,
              child: CircularProgressIndicator(
                value: progress,
                strokeWidth: 2.5,
                backgroundColor: Colors.white24,
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
            Text(
              '$current/$total',
              style: const TextStyle(color: Colors.white54, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
