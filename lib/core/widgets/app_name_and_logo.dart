import 'package:flutter/material.dart';

import '../utils/assets.dart';
import '../utils/size.dart';
import 'custom_images.dart';

class AppNameAndLogo extends StatelessWidget {
  const AppNameAndLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SizedBox(
              height: CustomSize().heightSize(context, .25),
              child: const CustomLogoImage(),
            ),
          ),
        ),
        const Text.rich(
          TextSpan(
              text: 'All Handcraft in\n',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                fontFamily: AssetDate.berlinFont,
              ),
              children: <InlineSpan>[
                TextSpan(
                  text: AssetDate.appName,
                  style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
                ),
              ]),
        ),
      ],
    );
  }
}
