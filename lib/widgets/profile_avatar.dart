import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 64,
            height: 88,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              image: const DecorationImage(
                image: AssetImage('assets/icons/Avatar.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
