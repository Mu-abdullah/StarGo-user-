import 'package:flutter/material.dart';

import '../utils/size.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
    required this.thickness,
    required this.color,
    this.endIndent = .1,
    this.indent = .1,
  });
  final Color color;
  final double thickness;
  final double endIndent;
  final double indent;
  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color,
      thickness: thickness,
      endIndent: CustomSize().widthSize(context, endIndent),
      indent: CustomSize().widthSize(context, indent),
    );
  }
}
