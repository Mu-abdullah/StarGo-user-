import 'package:flutter/material.dart';

class CustomSize {
  double heightSize(BuildContext context, double size) {
    return MediaQuery.of(context).size.height * size;
  }

  double widthSize(BuildContext context, double size) {
    return MediaQuery.of(context).size.width * size;
  }
}
