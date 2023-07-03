import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/texts.dart';
import 'custom_circle_progress.dart';

void customAlertDialog(
  context, {
  required String titleText,
  required String contentText,
  bool circularProgressIndicator = false,
  required Function() firstButton,
  required String firstButtonName,
  Function()? secondBotton,
  String? secondButtonName,
  required bool secondBtn,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          backgroundColor: AppColors.blackColor.withOpacity(.7),
          title: Align(
            alignment: Alignment.centerRight,
            child: TitleTexts(
              text: titleText,
              titleColor: AppColors.whiteColor,
            ),
          ),
          content: SubTitleTexts(
            text: contentText,
            subTitleColor: AppColors.whiteColor,
          ),
          actions: <Widget>[
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.zero,
                  child: circularProgressIndicator == true
                      ? const Center(
                          child: CustomProgressIndecator(),
                        )
                      : null,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: secondBtn == true
                          ? TextButton(
                              onPressed: secondBotton,
                              child: TitleTexts(
                                text: secondButtonName!,
                                titleColor: AppColors.whiteColor,
                              ))
                          : null,
                    ),
                    const Spacer(),
                    TextButton(
                        onPressed: firstButton,
                        child: TitleTexts(
                          text: firstButtonName,
                          titleColor: AppColors.secondColor,
                        )),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
