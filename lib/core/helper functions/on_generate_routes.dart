import 'package:e_commerce_app/features/auth/presentation/views/login_view.dart';
import 'package:e_commerce_app/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:e_commerce_app/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';

import '../../features/auth/presentation/views/register_view.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (_) => const SplashView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (_) => const OnBoardingView());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (_) => const LoginView());
    case RegisterView.routeName:
      return MaterialPageRoute(builder: (_) => const RegisterView());
    default:
      return MaterialPageRoute(builder: (_) => const SplashView());
  }
}
