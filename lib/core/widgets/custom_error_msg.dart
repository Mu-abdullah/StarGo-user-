import 'package:flutter/material.dart';

import '../utils/texts.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errMessage});
  final String errMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TitleTexts(text: errMessage),
    );
  }
}
