import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../widgets/home_app_bar.dart';
import '../../widgets/daily_progress_card.dart';
import '../../widgets/learning_banner_carousel.dart';
import '../../widgets/learning_plan_section.dart';
import '../../widgets/meetup_promo_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: AppColors.secondary,
              padding: const EdgeInsets.only(bottom: 24),
              child: const Column(
                children: [
                  HomeAppBar(userName: 'Kristin'),
                  SizedBox(height: 8),
                  DailyProgressCard(minutesLearned: 46, dailyGoalMinutes: 60),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: AppColors.primary,
                child: ListView(
                  padding: const EdgeInsets.only(top: 20, bottom: 12),
                  children: const [
                    LearningBannerCarousel(),
                    LearningPlanSection(
                      items: [
                        LearningPlanEntry(
                          title: 'Packaging Design',
                          current: 40,
                          total: 48,
                        ),
                        LearningPlanEntry(
                          title: 'Product Design',
                          current: 6,
                          total: 24,
                        ),
                      ],
                    ),
                    MeetupPromoCard(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
