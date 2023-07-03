import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:user/core/utils/size.dart';

import '../../../core/utils/app_routs.dart';
import '../../../core/utils/assets.dart';
import '../../../core/utils/constanent.dart';
import 'slide_text.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> animation;

  @override
  void initState() {
    super.initState();
    initAnimation();
    navigationDelayed();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetDate.logo),
        SlidingText(animation: animation),
        Expanded(
          flex: 1,
          child: Lottie.asset("assets/animation_json/pizza_load.json",
              height: CustomSize().heightSize(context, .3)),
        ),
      ],
    );
  }

  void navigationDelayed() {
    Future.delayed(const Duration(seconds: 5), () {
      if (cashHelperOnBoardingValue == null) {
        GoRouter.of(context).pushReplacement(AppRouter.boardScreen);
      } else {
        GoRouter.of(context).pushReplacement(AppRouter.welcomeScreen);
      }
    });
    FlutterNativeSplash.remove();
  }

  void initAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    animation = Tween<Offset>(
      begin: const Offset(0, 20),
      end: Offset.zero,
    ).animate(animationController);

    animationController.forward();
  }
}
