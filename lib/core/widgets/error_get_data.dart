import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../utils/assets.dart';
import '../utils/texts.dart';

class ErrorGetData extends StatelessWidget {
  const ErrorGetData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              // height: CustomSize().heightSize(context, .6),
              child: Lottie.asset(
                'assets/animation_json/error_animation.json',
              ),
            ),
            const TitleTexts(
              text: "يوجد مشكلة ونحن نعمل على حلها",
              fontFamily: AssetDate.messiriFont,
            ),
            const SubTitleTexts(
              text: "انتظرنا 😄",
              fontFamily: AssetDate.messiriFont,
            )
          ],
        ),
      ),
    );
  }
}
