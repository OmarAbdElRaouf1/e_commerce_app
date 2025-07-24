import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../constants.dart';
import '../../../../../core/services/shared_preferences_singleton.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../auth/presentation/views/signin_view.dart';
import '../../../../on_boarding/presentation/views/on_boarding_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> plantAnimation;
  late Animation<double> logoAnimation;
  late Animation<double> buttonAnimation;
  late Animation<double> opacityAnimation;

  @override
  void initState() {
    excuteNavigation();
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    plantAnimation = Tween<double>(begin: -50, end: 0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeOut),
    );

    logoAnimation = Tween<double>(begin: 50, end: 0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeOut),
    );

    buttonAnimation = Tween<double>(begin: -50, end: 0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeOut),
    );

    opacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeOut),
    );

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Opacity(
                  opacity: opacityAnimation.value,
                  child: Transform.translate(
                    offset: Offset(plantAnimation.value, 0),
                    child: SvgPicture.asset(Assets.imagesPlant),
                  ),
                ),
              ],
            ),
            Opacity(
              opacity: opacityAnimation.value,
              child: Transform.translate(
                offset: Offset(0, logoAnimation.value),
                child: SvgPicture.asset(Assets.imagesFruitLogo),
              ),
            ),
            Opacity(
              opacity: opacityAnimation.value,
              child: Transform.translate(
                offset: Offset(buttonAnimation.value, 0),
                child: SvgPicture.asset(Assets.imagesSplashButton),
              ),
            ),
          ],
        );
      },
    );
  }

  void excuteNavigation() {
    bool isOnBoardingViewSeen = Prefs.getBool(kIsOnBoardingViewSeen);
    Future.delayed(const Duration(seconds: 2), () {
      if (isOnBoardingViewSeen) {
        Navigator.pushReplacementNamed(context, SigninView.routeName);
      } else {
        Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
      }
    });
  }
}
