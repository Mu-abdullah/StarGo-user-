import 'package:flutter/material.dart';
import '../../../../../core/utils/assets.dart';
import 'colors.dart';

class SubTitleTexts extends StatelessWidget {
  const SubTitleTexts({
    super.key,
    required this.text,
    this.subTitleColor,
    this.fontSize = 18,
    this.fontWeight = FontWeight.normal,
    this.fontFamily = AssetDate.messiriFont,
    this.maxLines = 4,
    this.textAlign = TextAlign.center,
  });
  final String text;
  final Color? subTitleColor;
  final double fontSize;
  final FontWeight? fontWeight;
  final String fontFamily;
  final int maxLines;
  final TextAlign textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      textDirection: TextDirection.rtl,
      style: TextStyle(
        fontSize: fontSize,
        color: subTitleColor,
        fontWeight: fontWeight,
        fontFamily: fontFamily,
      ),
    );
  }
}

class TitleTexts extends StatelessWidget {
  const TitleTexts({
    super.key,
    required this.text,
    this.titleColor = AppColors.blackColor,
    this.fontSize = 21,
    this.fontFamily = AssetDate.messiriFont,
    this.fontWeight = FontWeight.bold,
    this.maxLines = 2,
    this.textAlign = TextAlign.center,
  });
  final String text;
  final double fontSize;
  final String fontFamily;
  final Color titleColor;
  final FontWeight? fontWeight;
  final int maxLines;
  final TextAlign textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      textDirection: TextDirection.rtl,
      style: TextStyle(
        color: titleColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: fontFamily,
      ),
    );
  }
}
