import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/services/shared_preferences_singleton.dart';
import 'package:e_commerce_app/core/utils/app_images.dart';
import 'package:e_commerce_app/features/auth/views/login_view.dart';
import 'package:e_commerce_app/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> imagesAnimation;

  @override
  void initState() {
    excuteNavigation();
    super.initState();
    animationController = AnimationController(vsync: this, duration: Duration(seconds: 4));

    imagesAnimation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: animationController, curve: Curves.easeInOut));
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FadeTransition(opacity: imagesAnimation, child: SvgPicture.asset(Assets.imagesPlant)),
          ],
        ),
        FadeTransition(opacity: imagesAnimation, child: SvgPicture.asset(Assets.imagesFruitLogo)),
        FadeTransition(opacity: imagesAnimation, child: SvgPicture.asset(Assets.imagesSplashButton)),
      ],
    );
  }

  void excuteNavigation() {
    bool isOnBoardingViewSeen = Prefs.getBool(kIsOnBoardingViewSeen);
    Future.delayed(const Duration(seconds: 4), () {
      if (isOnBoardingViewSeen) {
        Navigator.pushReplacementNamed(context, LoginView.routeName);
      } else {
        Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
      }
    });
  }
}
