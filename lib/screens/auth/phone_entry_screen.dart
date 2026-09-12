import 'package:flutter/material.dart';
import 'package:online_learning_app/screens/auth/verfiy_phone_screen.dart';
import '../../widgets/numeric_keypad.dart';
import '../../widgets/phone_number_field.dart';

class PhoneEntryScreen extends StatefulWidget {
  const PhoneEntryScreen({super.key});

  @override
  State<PhoneEntryScreen> createState() => _PhoneEntryScreenState();
}

class _PhoneEntryScreenState extends State<PhoneEntryScreen> {
  static const String _countryCode = '+63';
  String _phoneNumber = '';

  void _onDigitTap(String digit) {
    if (_phoneNumber.length >= 10) return;
    setState(() => _phoneNumber += digit);
  }

  void _onBackspaceTap() {
    if (_phoneNumber.isEmpty) return;
    setState(
      () => _phoneNumber = _phoneNumber.substring(0, _phoneNumber.length - 1),
    );
  }

  void _onContinueTap() {
    if (_phoneNumber.isEmpty) return;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) =>
            VerifyPhoneScreen(fullPhoneNumber: '$_countryCode $_phoneNumber'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1B33),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  const Text(
                    'Continue with Phone',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                color: Colors.white10,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.phone_iphone,
                color: Colors.white38,
                size: 56,
              ),
            ),
            const Spacer(),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
              decoration: const BoxDecoration(
                color: Color(0xFF17142A),
                borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Enter Your Phone Number',
                    style: TextStyle(color: Colors.white54, fontSize: 12),
                  ),
                  const SizedBox(height: 10),
                  PhoneNumberField(
                    countryCode: _countryCode,
                    phoneNumber: _phoneNumber,
                    onContinueTap: _onContinueTap,
                  ),
                  const SizedBox(height: 20),
                  NumericKeypad(
                    onDigitTap: _onDigitTap,
                    onBackspaceTap: _onBackspaceTap,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
