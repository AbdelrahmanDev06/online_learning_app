import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';

class OtpCodeBoxes extends StatelessWidget {
  final String code;
  final int length;

  const OtpCodeBoxes({super.key, required this.code, this.length = 4});

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
            color: AppColors.inputFill,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isFilled ? AppColors.secondary : AppColors.dividerFaint,
            ),
          ),
          child: Text(
            digit,
            style: const TextStyle(
              color: AppColors.textPrimaryLight,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      }),
    );
  }
}
