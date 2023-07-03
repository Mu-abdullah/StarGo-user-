import 'package:flutter/material.dart';

import '../utils/assets.dart';
import '../utils/colors.dart';
import '../utils/texts.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snackBar(context,
    {required String contentText, required int seconds}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    behavior: SnackBarBehavior.floating,
    backgroundColor: AppColors.primaryColor,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: TitleTexts(
              text: contentText,
              maxLines: 3,
              fontFamily: AssetDate.messiriFont,
              titleColor: AppColors.blackColor),
        ),
      ],
    ),
    duration: Duration(seconds: seconds),
  ));
}
