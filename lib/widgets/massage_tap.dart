import 'package:flutter/material.dart';
import 'package:online_learning_app/widgets/massage_card.dart';

class MassageTap extends StatelessWidget {
  const MassageTap({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        MassageCard(
          name: "Bert Pullman",
          status: "Online",
          time: "04:32 pm",
          message:
              "Congratulations on completing the first lesson, keep up the good work!",
        ),

        MassageCard(
          name: "Daniel Lawson",
          status: "Online",
          time: "04:32 pm",
          message:
              "Your course has been updated, you can check the new course in your study course.",
          hasImage: true,
        ),

        MassageCard(
          name: "Nguyen Shane",
          status: "Offline",
          time: "12:00 am",
          message:
              "Congratulations, you have completed your Let's start your learning journey next.",
        ),
        MassageCard(
          name: "hager yasser",
          status: "Online",
          time: "04:32 pm",
          message:
              "Congratulations on completing the first lesson, keep up the good work!",
        ),
      ],
    );
  }
}
