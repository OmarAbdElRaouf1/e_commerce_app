import 'package:e_commerce_app/features/auth/presentation/views/signin_view.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/forget_password_button.dart'
    show ForgotPasswordviewBody;
import 'package:e_commerce_app/features/checkout/presentation/views/checkout_view.dart';
import 'package:e_commerce_app/features/home/domain/entities/cart_entity.dart';
import 'package:e_commerce_app/features/home/presentation/views/Pages/home_view.dart';
import 'package:e_commerce_app/features/home/presentation/views/Pages/profile_view.dart';
import 'package:e_commerce_app/features/home/presentation/views/main_view.dart';
import 'package:e_commerce_app/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:e_commerce_app/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';

import '../../features/auth/presentation/views/signup_view.dart';
import '../../features/home/presentation/views/Pages/cart_view.dart';
import '../../features/home/presentation/views/Pages/products_view.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (_) => const SplashView());
    case CheckoutView.routeName:
      return MaterialPageRoute(
          builder: (_) =>
              CheckoutView(cartEntity: settings.arguments as CartEntity));
    case MainView.routeName:
      return MaterialPageRoute(builder: (_) => const MainView());
    case HomeView.routeName:
      return MaterialPageRoute(builder: (_) => const HomeView());
    case ProductsView.routeName:
      return MaterialPageRoute(builder: (_) => const ProductsView());
    case CartView.routeName:
      return MaterialPageRoute(builder: (_) => const CartView());
    case ProfileView.routeName:
      return MaterialPageRoute(builder: (_) => const ProfileView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (_) => const OnBoardingView());
    case ForgotPasswordviewBody.routeName:
      return MaterialPageRoute(builder: (_) => ForgotPasswordviewBody());
    case SigninView.routeName:
      return MaterialPageRoute(builder: (_) => const SigninView());
    case SignupView.routeName:
      return MaterialPageRoute(builder: (_) => const SignupView());
    default:
      return MaterialPageRoute(builder: (_) => const SplashView());
  }
}
