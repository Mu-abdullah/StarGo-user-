import '../utils/colors.dart';
import 'package:flutter/material.dart';

class CustomProgressIndecator extends StatelessWidget {
  const CustomProgressIndecator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<Color?>(
      tween: ColorTween(begin: AppColors.secondColor, end: Colors.red),
      duration: const Duration(seconds: 1),
      builder: (context, value, child) {
        return const CircularProgressIndicator(
          value: null,
          strokeWidth: 5,
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
        );
      },
    );
  }
}
