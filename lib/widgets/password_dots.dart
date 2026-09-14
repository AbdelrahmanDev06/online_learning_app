import 'package:flutter/material.dart';

class PasswordDots extends StatelessWidget {
  final int filledCount;
  final int totalCount;

  const PasswordDots({
    super.key,
    required this.filledCount,
    this.totalCount = 6,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalCount, (index) {
        final bool isFilled = index < filledCount;
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 6),
          width: 44,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(12),
            color: Color(0xff3E3E55),
          ),
          child: isFilled
              ? Center(
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                )
              : null,
        );
      }),
    );
  }
}
