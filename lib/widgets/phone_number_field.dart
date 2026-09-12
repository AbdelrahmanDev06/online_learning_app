import 'package:flutter/material.dart';

class PhoneNumberField extends StatelessWidget {
  final String countryCode;
  final String phoneNumber;
  final VoidCallback onContinueTap;

  const PhoneNumberField({
    super.key,
    required this.countryCode,
    required this.phoneNumber,
    required this.onContinueTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.06),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              '$countryCode $phoneNumber',
              style: const TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ),
        const SizedBox(width: 12),
        ElevatedButton(
          onPressed: onContinueTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF3B6FF6),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text('Continue'),
        ),
      ],
    );
  }
}
