import 'package:flutter/material.dart';
import '../../../../../core/utils/assets.dart';

class CustomLogoImage extends StatelessWidget {
  const CustomLogoImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.7 / 4,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          image: DecorationImage(
            image: AssetImage(AssetDate.logo),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
