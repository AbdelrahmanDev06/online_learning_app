import 'package:flutter/material.dart';
import 'package:online_learning_app/widgets/Notification_card.dart';

class NotificationTap extends StatelessWidget {
  const NotificationTap({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        NotificationCard(
          title: "Successful purchase!",
          time: "Just now",
          icon: Icons.card_giftcard,
        ),

        NotificationCard(
          title: "Congratulations on completing the course",
          time: "Just now",
          icon: Icons.menu_book,
        ),

        NotificationCard(
          title: "Your course has been updated",
          time: "Just now",
          icon: Icons.menu_book,
        ),

        NotificationCard(
          title: "Congratulations, you have completed",
          time: "Just now",
          icon: Icons.menu_book,
        ),
      ],
    );
  }
}
