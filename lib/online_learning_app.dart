import 'package:flutter/material.dart';
import 'package:online_learning_app/screens/wallet_card_page.dart';

class OnlineLearningApp extends StatelessWidget {
  const OnlineLearningApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const WalletCardPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
