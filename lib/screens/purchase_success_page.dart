import 'package:flutter/material.dart';
import '../widgets/primary_button.dart';
import 'clocking_in_page.dart';

class PurchaseSuccessPage extends StatelessWidget {
  const PurchaseSuccessPage({super.key});

  void _openClockingInPage(BuildContext context) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => const ClockingInPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF15162B),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(flex: 4),
              // صورة العلامة الصح + النقط/الزخارف حواليها
              Center(
                child: Image.asset(
                  'assets/images/done.png',
                  width: 180,
                  height: 180,
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 20),
              const Text(
                'Successful purchase!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 24),
              // const Spacer(flex: 5),
              PrimaryButton(
                label: 'Start learning',
                onPressed: () => _openClockingInPage(context),
              ),

              const SizedBox(height: 355),
            ],
          ),
        ),
      ),
    );
  }
}
