import 'package:flutter/material.dart';

import '../utils/assets.dart';
import '../utils/colors.dart';
import '../utils/size.dart';
import '../utils/texts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPress,
    required this.buttonName,
    this.width = 1,
    this.fontsize = 24,
    this.titleColor = AppColors.primaryColor,
    this.backgroungColor = AppColors.blackColor,
    this.loadingState = false,
    this.icon,
    required this.wantIcon,
    required this.arabic,
  });

  final Function() onPress;
  final String buttonName;
  final double width;
  final double fontsize;
  final Color titleColor;
  final Color backgroungColor;
  final bool loadingState;
  final bool wantIcon;
  final bool arabic;

  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: arabic ? TextDirection.rtl : TextDirection.rtl,
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          width: CustomSize().widthSize(context, width),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: backgroungColor),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: loadingState
                    ? const CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.zero,
                            child: wantIcon
                                ? Icon(
                                    icon,
                                    color: titleColor,
                                  )
                                : null,
                          ),
                          SizedBox(width: wantIcon ? 15 : 0),
                          TitleTexts(
                            text: buttonName,
                            titleColor: titleColor,
                            fontSize: fontsize,
                            fontFamily: AssetDate.messiriFont,
                          ),
                        ],
                      )),
          ),
        ),
      ),
    );
  }
}
