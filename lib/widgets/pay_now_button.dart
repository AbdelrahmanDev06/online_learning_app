import 'package:flutter/material.dart';

class PayNowButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;

  const PayNowButton({
    super.key,
    required this.onPressed,
    this.label = 'Pay Now',
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 335,
      height: 54,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF4C63F2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
