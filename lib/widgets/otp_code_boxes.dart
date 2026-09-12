import 'package:flutter/material.dart';

class OtpCodeBoxes extends StatelessWidget {
  final String code;
  final int length;

  const OtpCodeBoxes({
    super.key,
    required this.code,
    this.length = 4,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(length, (index) {
        final String digit = index < code.length ? code[index] : '';
        final bool isFilled = digit.isNotEmpty;

        return Container(
          width: 52,
          height: 56,
          margin: const EdgeInsets.symmetric(horizontal: 6),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.06),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isFilled ? const Color(0xFF3B6FF6) : Colors.white12,
            ),
          ),
          child: Text(
            digit,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      }),
    );
  }
}
