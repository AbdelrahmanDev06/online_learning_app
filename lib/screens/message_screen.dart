import 'package:flutter/material.dart';
import 'package:online_learning_app/widgets/Notification_tap.dart';
import 'package:online_learning_app/widgets/massage_tap.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  int selectedTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        titleTextStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    selectedTab = 0;
                  });
                },
                child: Text(
                  'massages',
                  style: TextStyle(
                    color: selectedTab == 0 ? Colors.deepPurple : Colors.grey,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    selectedTab = 1;
                  });
                },
                child: Text(
                  'notifications',
                  style: TextStyle(
                    color: selectedTab == 1 ? Colors.deepPurple : Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: selectedTab == 0
                ? const MassageTap()
                : const NotificationTap(), // Replace with your notification widget
          ),
        ],
      ),
    );
  }
}
