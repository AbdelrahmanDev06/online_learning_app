import 'package:flutter/material.dart';

/// دايرة يوم واحد في صف "Record of this week".
/// لو الرقم موجود (isCompleted = true) بتتلوّن أزرق وبيظهر جواها
/// رقم اليوم بالأبيض، ولو لسه معملهاش بتبقى دايرة بيضا فاضية
/// من غير رقم.
class WeekDayDot extends StatelessWidget {
  final int dayNumber;
  final bool isCompleted;

  const WeekDayDot({
    super.key,
    required this.dayNumber,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isCompleted ? const Color(0xFF4C63F2) : Colors.white,
      ),
      alignment: Alignment.center,
      child: isCompleted
          ? Text(
              '$dayNumber',
              style: const TextStyle(
                color: Color(0xffB8B8D2),
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            )
          : null,
    );
  }
}
