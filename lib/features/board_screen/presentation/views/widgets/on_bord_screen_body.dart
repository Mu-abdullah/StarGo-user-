import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:user/core/utils/app_routs.dart';
import 'package:user/core/utils/assets.dart';
import 'package:user/core/utils/colors.dart';
import 'package:user/core/utils/size.dart';
import 'package:user/core/utils/texts.dart';
import 'package:user/core/widgets/custom_button.dart';

import '../../../../../core/helper/shared_preferences.dart';
import '../../../../../core/utils/constanent.dart';
import '../../../data/model/board_model.dart';
import 'on_board_page_view_item.dart';

class OnBoardScreenBody extends StatefulWidget {
  const OnBoardScreenBody({
    super.key,
  });

  @override
  State<OnBoardScreenBody> createState() => _OnBoardScreenBodyState();
}

class _OnBoardScreenBodyState extends State<OnBoardScreenBody> {
  bool isLast = false;
  PageController boardController = PageController();
  List<BoardModel> boardItem = [
    BoardModel(
        AssetDate.saleJson, Constant.onBoardTitle1, Constant.onBoardSubTitle1),
    BoardModel(
        AssetDate.callJson, Constant.onBoardTitle2, Constant.onBoardSubTitle2),
    BoardModel(AssetDate.deliveryJson, Constant.onBoardTitle3,
        Constant.onBoardSubTitle3),
  ];
  void submitOnBoard() {
    CacheHelper.saveData(
      key: cashHelperOnBoardingKey,
      value: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: CustomSize().widthSize(context, 1),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
            color: AppColors.blackColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: const [
                  TitleTexts(
                    text: "Pizza",
                    titleColor: AppColors.whiteColor,
                    fontSize: 60,
                    fontFamily: AssetDate.berlinFont,
                  ),
                  TitleTexts(
                    text: "Star Go",
                    titleColor: AppColors.primaryColor,
                    fontSize: 60,
                    fontFamily: AssetDate.berlinFont,
                  ),
                ],
              ),
              Image.asset(
                AssetDate.logo,
                height: CustomSize().heightSize(context, .2),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          flex: 1,
          child: PageView.builder(
            itemCount: boardItem.length,
            controller: boardController,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            onPageChanged: (int index) {
              if (index == boardItem.length - 1) {
                setState(() {
                  isLast = true;
                });
              } else {
                setState(() {
                  isLast = false;
                });
              }
            },
            itemBuilder: (context, index) {
              return PageViewItem(
                boardModel: boardItem[index],
              );
            },
          ),
        ),
        SmoothPageIndicator(
          controller: boardController,
          count: boardItem.length,
          effect: const ExpandingDotsEffect(
              dotColor: AppColors.blackColor,
              activeDotColor: AppColors.primaryColor,
              dotHeight: 10,
              dotWidth: 10,
              spacing: 10,
              expansionFactor: 2.0),
        ),
        const SizedBox(height: 20),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: isLast == false
                ? null
                : CustomButton(
                    arabic: true,
                    onPress: () async {
                      submitOnBoard();
                      GoRouter.of(context)
                          .pushReplacement(AppRouter.welcomeScreen);
                      try {
                        await FirebaseAuth.instance.signInAnonymously();
                      } on FirebaseAuthException catch (e) {
                        switch (e.code) {
                          case "operation-not-allowed":
                            if (kDebugMode) {
                              print(
                                  "Anonymous auth hasn't been enabled for this project.");
                            }
                            break;
                          default:
                            if (kDebugMode) {
                              print("Unknown error.");
                            }
                        }
                      }
                    },
                    buttonName: "يلا اختار",
                    wantIcon: true,
                    backgroungColor: AppColors.primaryColor,
                    titleColor: AppColors.blackColor,
                    icon: Iconsax.home,
                  ),
          ),
        )
      ],
    );
  }
}
