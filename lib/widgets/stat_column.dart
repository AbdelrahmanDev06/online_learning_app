import 'package:flutter/material.dart';

/// عمود إحصائية واحدة: تسمية صغيرة رمادية فوق، وقيمة كبيرة بيضا
/// تحتها + وحدة القياس بجانبها بخط أصغر ورمادي.
class StatColumn extends StatelessWidget {
  final String label;
  final String value;
  final String unit;
  final CrossAxisAlignment alignment;

  const StatColumn({
    super.key,
    required this.label,
    required this.value,
    required this.unit,
    this.alignment = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignment,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Color(0xffB8B8D2),
            fontSize: 12,
            fontWeight: .bold,
          ),
        ),
        const SizedBox(height: 6),
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 4),
            Text(
              unit,
              style: TextStyle(
                color: Color(0xffB8B8D2),
                fontSize: 14,
                fontWeight: .bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
