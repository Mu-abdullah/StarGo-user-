import 'package:flutter/material.dart';

import '../../../core/utils/assets.dart';
import '../../../core/utils/texts.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    Key? key,
    required this.animation,
  }) : super(key: key);

  final Animation<Offset> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, _) => SlideTransition(
        position: animation,
        child: const TitleTexts(
          fontFamily: AssetDate.berlinFont,
          text: AssetDate.appName,
          fontSize: 48,
        ),
      ),
    );
  }
}
