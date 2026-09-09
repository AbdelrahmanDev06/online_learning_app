import 'package:flutter/material.dart';
import '/screens/onboarding/splash_screen.dart';
import '/screens/auth/login_screen.dart';
import '/screens/auth/signup_screen.dart';
import '/screens/home/home_screen.dart';
import '/screens/profile/profile_screen.dart';

class AppRoutes {
  static const splash = '/';
  static const login = '/login';
  static const signup = '/signup';
  static const home = '/home';
  static const profile = '/profile';

  static Map<String, WidgetBuilder> routes = {
    splash: (context) => const SplashScreen(),
    login: (context) => const LoginScreen(),
    signup: (context) => const SignupScreen(),
    home: (context) => const HomeScreen(),
    profile: (context) => const ProfileScreen(),
  };
}
