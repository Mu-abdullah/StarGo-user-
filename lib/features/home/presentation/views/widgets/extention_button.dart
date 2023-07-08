import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../../core/widgets/custom_button.dart';
import 'extention_bar.dart';

class ExtentionButton extends StatelessWidget {
  const ExtentionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomButton(
        onPress: () {
          showBarModalBottomSheet(
            context: context,
            expand: false,
            builder: (context) {
              return const ExtentionBar();
            },
          );
        },
        buttonName: "اطلب اضافات",
        wantIcon: true,
        arabic: true,
        icon: Iconsax.additem,
      ),
    );
  }
}