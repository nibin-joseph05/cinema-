import 'package:flutter/material.dart';
import 'package:cinema_plus/features/splash/presentation/screens/splash_screen.dart';
import 'package:cinema_plus/features/auth/presentation/screens/welcome_screen.dart';

import '../features/auth/presentation/screens/login_screen.dart';
import '../features/auth/presentation/screens/register_screen.dart';
import '../features/auth/presentation/screens/select_city_screen.dart';

class AppRouter {
  static const splash = '/';
  static const welcome = '/welcome';
  static const selectCity = '/select-city';
  static const login = '/login';
  static const register = '/register';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case welcome:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case selectCity:
        return MaterialPageRoute(builder: (_) => const SelectCityScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());

      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}
