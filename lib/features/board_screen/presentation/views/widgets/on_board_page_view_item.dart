import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:user/core/utils/colors.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/size.dart';
import '../../../../../core/utils/texts.dart';
import '../../../data/model/board_model.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.boardModel,
  });
  final BoardModel boardModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Lottie.asset(boardModel.image,
            height: CustomSize().heightSize(context, .3)),
        const SizedBox(
          height: 60,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
                color: AppColors.primaryColor),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: TitleTexts(
                    text: boardModel.title,
                    fontSize: 36,
                    fontFamily: AssetDate.messiriFont,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SubTitleTexts(
                    text: boardModel.subTiltle,
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    subTitleColor: AppColors.whiteColor,
                    fontFamily: AssetDate.messiriFont,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
