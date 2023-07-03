import 'package:flutter/material.dart';
import 'package:user/core/utils/assets.dart';
import '../utils/colors.dart';
import '../utils/texts.dart';
import 'custom_circle_progress.dart';

Future<dynamic> alertWithCircleProgress(BuildContext context,
    {required String titleText}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: AppColors.blackColor.withOpacity(.8),
        actionsPadding: const EdgeInsets.symmetric(vertical: 25),
        actions: <Widget>[
          Center(
              child: Column(
            children: [
              const CustomProgressIndecator(),
              const SizedBox(
                height: 20,
              ),
              TitleTexts(
                text: titleText,fontFamily: AssetDate.messiriFont,
                titleColor: AppColors.whiteColor,
              )
            ],
          )),
        ],
      );
    },
  );
}
