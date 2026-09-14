import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  bool _isPlaying = false;
  int _activeLessonIndex = 0;

  final List<_Lesson> _lessons = const [
    _Lesson(title: 'Welcome to the Course', duration: '6:10', isLocked: false),
    _Lesson(title: 'Process overview', duration: '6:10', isLocked: false),
    _Lesson(title: 'Discovery', duration: '6:10', isLocked: true),
  ];

  void _togglePlay(int index) {
    setState(() {
      if (_activeLessonIndex == index) {
        _isPlaying = !_isPlaying;
      } else {
        _activeLessonIndex = index;
        _isPlaying = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Column(
          children: [
            _isPlaying ? _buildVideoHeader() : _buildImageHeader(),

            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(28),
                    topRight: Radius.circular(28),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTitleRow(),
                    const SizedBox(height: 4),
                    Text(
                      '6h 14min  ·  24 Lessons',
                      style: TextStyle(
                        color: AppColors.textMutedLight,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'About this course',
                      style: TextStyle(
                        color: AppColors.textPrimaryLight,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Sed ut perspiciatis unde omnis iste natus error sit '
                      'voluptatem accusantium doloremque laudantium,',
                      style: TextStyle(
                        color: AppColors.textMutedLight,
                        fontSize: 13,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Center(
                      child: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: AppColors.textFaintLight,
                      ),
                    ),
                    const SizedBox(height: 12),

                    Expanded(
                      child: ListView.separated(
                        padding: EdgeInsets.zero,
                        itemCount: _lessons.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 18),
                        itemBuilder: (context, index) {
                          return _buildLessonTile(index);
                        },
                      ),
                    ),

                    const SizedBox(height: 12),
                    _buildBottomBar(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageHeader() {
    return Container(
      width: double.infinity,
      height: 300,
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 40),
      decoration: const BoxDecoration(color: AppColors.lightCard),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: GestureDetector(
              onTap: () => Navigator.of(context).maybePop(),
              child: const Icon(
                Icons.visibility_off_outlined,
                color: AppColors.textPrimaryDark,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Image.asset(
                'assets/images/course_illustration.png',
                height: 200,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => const SizedBox(
                  height: 200,
                  width: 160,
                  child: Icon(
                    Icons.emoji_people,
                    size: 90,
                    color: AppColors.iconAccent,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFC107),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    'BESTSELLER',
                    style: TextStyle(
                      color: AppColors.textPrimaryDark,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'ProductDesign v1.0',
                  style: TextStyle(
                    color: AppColors.textPrimaryDark,
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVideoHeader() {
    return Container(
      width: double.infinity,
      height: 300,
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
      decoration: const BoxDecoration(color: AppColors.darkCard),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: GestureDetector(
              onTap: () => Navigator.of(context).maybePop(),
              child: const Icon(
                Icons.visibility_off_outlined,
                color: AppColors.textPrimaryLight,
              ),
            ),
          ),
          Center(
            child: GestureDetector(
              onTap: () => _togglePlay(_activeLessonIndex),
              child: Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.textPrimaryLight.withValues(alpha: 0.25),
                ),
                child: const Icon(
                  Icons.pause,
                  color: AppColors.textPrimaryLight,
                  size: 30,
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Icon(
              Icons.fullscreen,
              color: AppColors.textPrimaryLight,
              size: 22,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              children: [
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 2,
                    thumbShape: const RoundSliderThumbShape(
                      enabledThumbRadius: 6,
                    ),
                    overlayShape: SliderComponentShape.noOverlay,
                    activeTrackColor: AppColors.secondaryButton,
                    inactiveTrackColor: AppColors.dividerLight,
                    thumbColor: AppColors.secondaryButton,
                  ),
                  child: Slider(value: 0.6, onChanged: (_) {}),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '4:10',
                        style: TextStyle(
                          color: AppColors.textSecondaryLight,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        '6:10',
                        style: TextStyle(
                          color: AppColors.textSecondaryLight,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitleRow() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Product Design v1.0',
          style: TextStyle(
            color: AppColors.textPrimaryLight,
            fontSize: 19,
            fontWeight: FontWeight.w800,
          ),
        ),
        Text(
          '\$74.00',
          style: TextStyle(
            color: AppColors.secondary,
            fontSize: 19,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }

  Widget _buildLessonTile(int index) {
    final lesson = _lessons[index];
    final bool isActive = index == _activeLessonIndex && _isPlaying;
    final bool isCompleted = index == 0;

    return Row(
      children: [
        Text(
          '0${index + 1}',
          style: TextStyle(
            color: AppColors.textMutedLight,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                lesson.title,
                style: const TextStyle(
                  color: AppColors.textPrimaryLight,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text(
                    lesson.duration,
                    style: TextStyle(
                      color: isActive
                          ? AppColors.secondaryButton
                          : AppColors.textMutedLight,
                      fontSize: 12,
                      fontWeight: isActive ? FontWeight.w700 : FontWeight.w400,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'mins',
                    style: TextStyle(
                      color: AppColors.textMutedLight,
                      fontSize: 12,
                    ),
                  ),
                  if (isCompleted) ...[
                    const SizedBox(width: 6),
                    Icon(
                      Icons.check_circle,
                      size: 14,
                      color: isActive
                          ? AppColors.secondaryButton
                          : AppColors.secondary,
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: lesson.isLocked ? null : () => _togglePlay(index),
          child: Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: lesson.isLocked
                  ? AppColors.darkSurfaceAlt
                  : AppColors.secondary,
              border: isActive
                  ? Border.all(color: AppColors.secondaryButton, width: 2)
                  : null,
            ),
            child: Icon(
              lesson.isLocked
                  ? Icons.lock_outline
                  : (isActive ? Icons.pause : Icons.play_arrow),
              color: lesson.isLocked
                  ? AppColors.textFaintLight
                  : AppColors.textPrimaryLight,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomBar() {
    return Row(
      children: [
        Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            color: AppColors.meetupCard,
            borderRadius: BorderRadius.circular(14),
          ),
          child: const Icon(
            Icons.star_border_rounded,
            color: AppColors.secondaryButton,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: SizedBox(
            height: 52,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.secondary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Buy Now',
                style: TextStyle(
                  color: AppColors.textPrimaryLight,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _Lesson {
  final String title;
  final String duration;
  final bool isLocked;

  const _Lesson({
    required this.title,
    required this.duration,
    required this.isLocked,
  });
}
