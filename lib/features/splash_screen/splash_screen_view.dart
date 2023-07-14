import 'package:flutter/material.dart';
import 'package:user/core/utils/colors.dart';

import 'widgets/splash_view_body.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SplashViewBody(),
      ),
    );
  }
}
