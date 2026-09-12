import 'package:flutter/material.dart';
import '../../core/routes/app_routes.dart';
import '../../widgets/numeric_keypad.dart';
import '../../widgets/otp_code_boxes.dart';
import '../../widgets/auth_primary_button.dart';

class VerifyPhoneScreen extends StatefulWidget {
  final String fullPhoneNumber;

  const VerifyPhoneScreen({super.key, required this.fullPhoneNumber});

  @override
  State<VerifyPhoneScreen> createState() => _VerifyPhoneScreenState();
}

class _VerifyPhoneScreenState extends State<VerifyPhoneScreen> {
  static const int _codeLength = 4;
  String _code = '';

  void _onDigitTap(String digit) {
    if (_code.length >= _codeLength) return;
    setState(() => _code += digit);
  }

  void _onBackspaceTap() {
    if (_code.isEmpty) return;
    setState(() => _code = _code.substring(0, _code.length - 1));
  }

  void _handleVerify() {
    if (_code.length < _codeLength) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Enter the full code')));
      return;
    }
    Navigator.of(
      context,
    ).pushNamedAndRemoveUntil(AppRoutes.main, (route) => false);
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
                    'Verify Phone',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Code is sent to ${widget.fullPhoneNumber}',
              style: const TextStyle(color: Colors.white54, fontSize: 13),
            ),
            const SizedBox(height: 24),
            OtpCodeBoxes(code: _code, length: _codeLength),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {},
              child: const Text.rich(
                TextSpan(
                  text: "Didn't receive code? ",
                  style: TextStyle(color: Colors.white38, fontSize: 12),
                  children: [
                    TextSpan(
                      text: 'Request again',
                      style: TextStyle(
                        color: Color(0xFF3B6FF6),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
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
                children: [
                  AuthPrimaryButton(
                    label: 'Verify and Create Account',
                    onPressed: _handleVerify,
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
