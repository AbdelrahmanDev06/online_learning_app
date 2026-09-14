import 'package:flutter/material.dart';

class MassageCard extends StatelessWidget {
  final String name;
  final String status;
  final String time;
  final String message;
  final bool hasImage;

  const MassageCard({
    super.key,
    required this.name,
    required this.status,
    required this.time,
    required this.message,
    this.hasImage = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Color(0xFF2F2F42),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: const Color(0xffd7fff2),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    status,
                    style: const TextStyle(
                      color: Color(0xFFD8FFEF),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const Spacer(),

              Text(
                time,
                style: const TextStyle(color: Color(0xFFB8B8D2), fontSize: 12),
              ),
            ],
          ),

          const SizedBox(height: 14),

          Text(
            message,
            style: const TextStyle(color: Colors.white, fontSize: 13),
          ),
          if (hasImage)
            Container(
              margin: const EdgeInsets.only(top: 20),
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFE7EEFF),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
        ],
      ),
    );
  }
}
