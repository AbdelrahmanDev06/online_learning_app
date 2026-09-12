import 'package:flutter/material.dart';
import '../../screens/onboarding/splash_screen.dart';
import '../../screens/onboarding/onboarding_screen.dart';
import '../../screens/bottom_nav_bar_screen.dart';
import '../../screens/auth/login_screen.dart';
import '../../screens/auth/signup_screen.dart';
import '../../screens/auth/phone_entry_screen.dart';

/// Central place for route names + route generation.
/// Add a new screen: 1) give it a name below, 2) add a case in
/// [generateRoute], 3) navigate with Navigator.pushNamed(context, name).
class AppRoutes {
  AppRoutes._();

  static const String splash = '/splash';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String phoneEntry = '/phone-entry';
  static const String main = '/main';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case onboarding:
        return MaterialPageRoute(
          builder: (context) => OnboardingScreen(
            onFinished: () => Navigator.of(context).pushReplacementNamed(login),
            onSignUp: () => Navigator.of(context).pushNamed(signup),
            onLogIn: () => Navigator.of(context).pushNamed(login),
          ),
        );

      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case signup:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());

      case phoneEntry:
        return MaterialPageRoute(builder: (_) => const PhoneEntryScreen());

      case main:
        return MaterialPageRoute(builder: (_) => const BottomNavBarScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
