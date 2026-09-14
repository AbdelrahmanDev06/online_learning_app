import 'package:flutter/material.dart';

class LearningBannerCarousel extends StatelessWidget {
  final VoidCallback? onGetStartedTap;

  const LearningBannerCarousel({super.key, this.onGetStartedTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          _MainBannerCard(onGetStartedTap: onGetStartedTap),
          const SizedBox(width: 12),
          const _SecondaryBannerCard(),
        ],
      ),
    );
  }
}

class _MainBannerCard extends StatelessWidget {
  final VoidCallback? onGetStartedTap;

  const _MainBannerCard({this.onGetStartedTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFDCE6FB),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          // TODO: replace with the real illustration once the team has it,
          // e.g.:
          // Positioned(
          //   right: -10,
          //   bottom: -10,
          //   child: Image.asset('assets/images/home_banner_illustration.png',
          //       height: 130),
          // ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'What do you want to learn today?',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const Spacer(),
              ElevatedButton(
                // A null onPressed disables the button and forces it grey,
                // so we fall back to a no-op instead of leaving it null.
                onPressed: onGetStartedTap ?? () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('Get Started'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SecondaryBannerCard extends StatelessWidget {
  const _SecondaryBannerCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      decoration: BoxDecoration(
        color: const Color(0xFFDCE6FB),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/images/home.png', fit: BoxFit.cover),
          ),
          const Center(
            child: Icon(Icons.check_circle, color: Colors.green, size: 32),
          ),
        ],
      ),
    );
  }
}
