import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../utils/assets.dart';
import '../utils/size.dart';
import '../utils/texts.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: CustomSize().heightSize(context, .4),
            child: Lottie.asset(
              'assets/animation_json/nointernet.json',
            ),
          ),
          const TitleTexts(
            text: "لا يوجد اتصال بالإنترنت",
            fontFamily: AssetDate.messiriFont,
            fontSize: 48,
          ),
          const SubTitleTexts(
            text: "برجاء التحقق من الإنترنت",
            fontFamily: AssetDate.messiriFont,
            fontSize: 24,
          )
        ],
      ),
    );
  }
}
