import 'package:flutter/material.dart';
import '../widgets/password_dots.dart';
import '../widgets/numeric_keypad.dart';

class PaymentPasswordSheet extends StatefulWidget {
  const PaymentPasswordSheet({super.key});

  @override
  State<PaymentPasswordSheet> createState() => _PaymentPasswordSheetState();
}

class _PaymentPasswordSheetState extends State<PaymentPasswordSheet> {
  static const int _passwordLength = 6;
  String _password = '';

  void _onKeyTap(String key) {
    setState(() {
      if (key == 'backspace') {
        if (_password.isNotEmpty) {
          _password = _password.substring(0, _password.length - 1);
        }
      } else if (_password.length < _passwordLength) {
        _password += key;
      }
    });

    if (_password.length == _passwordLength) {
      Future.delayed(const Duration(milliseconds: 200), () {
        if (mounted) Navigator.of(context).pop(_password);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF2F2F42),
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        // padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // مقبض السحب فوق الشيت
            Container(
              width: 60,
              height: 4,
              // margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.25),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            SizedBox(height: 31),
            const Text(
              'Payment Password',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Please enter the payment password',
              style: TextStyle(color: Color(0xffB8B8D2), fontSize: 13),
            ),

            const SizedBox(height: 24),

            PasswordDots(
              filledCount: _password.length,
              totalCount: _passwordLength,
            ),

            const SizedBox(height: 39),
            NumericKeypad(onKeyTap: _onKeyTap),

            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
