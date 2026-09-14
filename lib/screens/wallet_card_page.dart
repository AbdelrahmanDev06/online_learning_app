import 'package:flutter/material.dart';
import '../widgets/card_widget.dart';
import '../widgets/pay_now_button.dart';
import 'payment_password_sheet.dart';
import 'purchase_success_page.dart';

class WalletCardPage extends StatelessWidget {
  const WalletCardPage({super.key});

  Future<void> _openPasswordSheet(BuildContext context) async {
    final password = await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const PaymentPasswordSheet(),
    );

    // لو الباسورد اتكتب كامل
    if (password != null && context.mounted) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const PurchaseSuccessPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF15162B),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // الكارت
              const CardWidget(lastDigits: '4829'),

              const SizedBox(height: 13.6),
              // دقيمة الرصيد
              const Text(
                '\$23,900.00',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'My card',
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xffB8B8D2), fontSize: 20),
              ),

              const Spacer(),

              // النقط الثلاثة النص
              Text(
                '•  •  •',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  // letterSpacing: 0,
                ),
              ),

              const SizedBox(height: 112),
              // زرار الدفع
              PayNowButton(onPressed: () => _openPasswordSheet(context)),

              const SizedBox(height: 147),
            ],
          ),
        ),
      ),
    );
  }
}
