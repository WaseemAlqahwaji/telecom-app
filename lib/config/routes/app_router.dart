import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telecom_project/config/routes/route_path.dart';
import 'package:telecom_project/features/adsl/view/screens/adsl_main_screen.dart';
import 'package:telecom_project/features/electric/view/screens/electric_screen.dart';
import 'package:telecom_project/features/financial/view/screens/financial_screen.dart';
import 'package:telecom_project/features/funds/view/screens/funds_screen.dart';
import 'package:telecom_project/features/home/view/screens/home_screen.dart';
import 'package:telecom_project/features/login/view/screens/login_screen.dart';
import 'package:telecom_project/features/home_phone/view/screens/home_phone_screen.dart';
import 'package:telecom_project/features/opration/view/cubit/opration_cubit.dart';
import 'package:telecom_project/features/opration/view/screens/opration_screen.dart';
import 'package:telecom_project/features/paid/view/paid_screen.dart';
import 'package:telecom_project/features/water/view/screens/water_main_screen.dart';
import 'package:telecom_project/features/app_gems/view/screens/app_gem_screen.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case Routes.fundScreen:
        return MaterialPageRoute(
          builder: (_) => const FundsScreen(),
        );
      case Routes.financialScreen:
        return MaterialPageRoute(
          builder: (_) => const FinancialScreen(),
        );
      case Routes.paidScreen:
        return MaterialPageRoute(
          builder: (_) => const PaidScreen(),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case Routes.adslScreen:
        return MaterialPageRoute(
          builder: (_) => const AdslMainScreen(),
        );
      case Routes.waterScreen:
        return MaterialPageRoute(
          builder: (_) => const WaterScreen(),
        );
      case Routes.electicScreen:
        return MaterialPageRoute(
          builder: (_) => const ElectricScreen(),
        );
      case Routes.homePhoneScreen:
        return MaterialPageRoute(
          builder: (_) => const HomePhoneScreen(),
        );
      case Routes.oprationScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => OprationCubit(),
            child: const OprationScreen(),
          ),
        );
      case Routes.appGemsScreen:
        return MaterialPageRoute(
          builder: (_) => const AppGemScreen(),
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
