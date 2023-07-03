import 'package:blobs/blobs.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:user/core/utils/app_routs.dart';
import 'package:user/core/utils/assets.dart';
import 'package:user/core/utils/size.dart';
import 'package:user/core/utils/texts.dart';
import 'package:user/core/widgets/custom_button.dart';

import '../../../../core/utils/colors.dart';
import 'widgets/welcome_bottom_sheet.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Blob.fromID(
                    id: const ['20-9-324320'],
                    size: CustomSize().widthSize(context, 1),
                    styles: BlobStyles(
                      color: AppColors.whiteColor,
                    ),
                    child: Image.asset(AssetDate.logo)),
                const SizedBox(height: 5),
                const TitleTexts(text: "ازيك .. اقدر اساعدك ازاي؟"),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: CustomButton(
                        arabic: false,
                        onPress: () {
                          GoRouter.of(context).push(AppRouter.homeScreen);
                        },
                        wantIcon: true,
                        icon: Iconsax.menu_board,
                        buttonName: "القائمة",
                        titleColor: AppColors.whiteColor,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      flex: 1,
                      child: CustomButton(
                          arabic: false,
                          wantIcon: false,
                          titleColor: AppColors.whiteColor,
                          onPress: () {
                            showMaterialModalBottomSheet(
                              context: context,
                              expand: false,
                              enableDrag: true,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(25),
                                ),
                              ),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              builder: (context) {
                                return const WelcomeScreenBottomSheet();
                              },
                            );
                          },
                          buttonName: "تواصل معانا"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
