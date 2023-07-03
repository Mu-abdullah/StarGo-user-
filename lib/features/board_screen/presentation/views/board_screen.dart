import 'package:flutter/material.dart';
import 'package:user/features/board_screen/presentation/views/widgets/on_bord_screen_body.dart';

class OnBoardScreen extends StatelessWidget {
  const OnBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Directionality(
      textDirection: TextDirection.ltr,
      child: SafeArea(
        child: Scaffold(
          body: OnBoardScreenBody(),
        ),
      ),
    );
  }
}
