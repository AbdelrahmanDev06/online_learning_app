import 'package:flutter/material.dart';

/// Widget بيمثل الكارت نفسه (الصورة اللي فوق) + رقم الكارت المتقطع
/// فوق الصورة. الصورة بتتحمل من assets/images/card.png
class CardWidget extends StatelessWidget {
  final String lastDigits;

  const CardWidget({super.key, this.lastDigits = '4829'});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: SizedBox(
        height: 198,
        width: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: [
            // صورة الكارت (الخلفية بالتدرج اللوني)
            Image.asset('assets/images/card.png', fit: BoxFit.cover),

            // أيقونة صغيرة أعلى اليمين (شبيهة بالـ chip / signal)
            Positioned(
              top: 16,
              right: 16,
              child: Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.25),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),

            // رقم الكارت المتقطع أسفل يسار الصورة
            Positioned(
              left: 20,
              bottom: 20,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildDots(),
                  const SizedBox(width: 5),
                  Text(
                    lastDigits,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDots() {
    return Row(
      children: List.generate(3, (groupIndex) {
        return Padding(
          padding: const EdgeInsets.only(right: 6),
          child: Row(
            children: List.generate(4, (dotIndex) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 1.5),
                width: 7,
                height: 7,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              );
            }),
          ),
        );
      }),
    );
  }
}
