import 'package:flutter/material.dart';
import '../../widgets/onboarding_page_data.dart';
import '../../widgets/onboarding_page_view.dart';
import '../../widgets/page_indicator_dots.dart';

class OnboardingScreen extends StatefulWidget {
  final VoidCallback onFinished;
  final VoidCallback? onSignUp;
  final VoidCallback? onLogIn;

  const OnboardingScreen({
    super.key,
    required this.onFinished,
    this.onSignUp,
    this.onLogIn,
  });

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  static const _pages = [
    OnboardingPageData(
      illustrationAsset: 'assets\images\1.png',
      title: 'Numerous free\ntrial courses',
      subtitle: 'Free courses for you to\nfind your way to learning',
    ),
    OnboardingPageData(
      illustrationAsset: 'assets/images/2.png',
      title: 'Quick and easy\nlearning',
      subtitle:
          'Easy and fast learning at\nany time to help you\nimprove various skills',
    ),
    OnboardingPageData(
      illustrationAsset: 'assets/images/3.png',
      title: 'Create your own\nstudy plan',
      subtitle:
          'Study according to the\nstudy plan, make study\nmore motivated',
    ),
  ];

  bool get _isLastPage => _currentPage == _pages.length - 1;

  void _goToNextPage() {
    if (_isLastPage) {
      widget.onFinished();
    } else {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1B33),
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                child: Visibility(
                  visible: !_isLastPage,
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  child: TextButton(
                    onPressed: widget.onFinished,
                    child: const Text(
                      'Skip',
                      style: TextStyle(color: Colors.white54, fontSize: 14),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: _pages.length,
                onPageChanged: (index) => setState(() => _currentPage = index),
                itemBuilder: (context, index) =>
                    OnboardingPageView(data: _pages[index]),
              ),
            ),
            const SizedBox(height: 16),
            PageIndicatorDots(
              pageCount: _pages.length,
              currentIndex: _currentPage,
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: _isLastPage ? _buildAuthButtons() : _buildNextButton(),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildNextButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: _goToNextPage,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurpleAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: const Text('Next'),
      ),
    );
  }

  Widget _buildAuthButtons() {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed: widget.onSignUp ?? widget.onFinished,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurpleAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: const Text('Sign up'),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: SizedBox(
            height: 50,
            child: OutlinedButton(
              onPressed: widget.onLogIn ?? widget.onFinished,
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.white24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: const Text(
                'Log in',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
