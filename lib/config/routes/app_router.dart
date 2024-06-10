import 'package:flutter/material.dart';
import 'package:telecom_project/features/adsl/view/screens/adsl_main_screen.dart';
import 'package:telecom_project/features/home/view/screens/home_screen.dart';
import 'package:telecom_project/features/login/view/screens/login_screen.dart';
import 'package:telecom_project/features/water/view/screens/water_main_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'loginScreen':
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case 'homeScreen':
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case 'adslScreen':
        return MaterialPageRoute(
          builder: (_) => const AdslMainScreen(),
        );
        case 'waterScreen':
        return MaterialPageRoute(
          builder: (_) => const WaterScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text(
                'No route defined for ${settings.name}',
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
    }
  }
}
